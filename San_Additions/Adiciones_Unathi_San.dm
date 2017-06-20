/*
* Adiciones para los Unathi (Posibles):
*
* 1- Que los Unathi no se ralenticen con lo de llevar armaduras, o que al menos se ralenticen la mitad
* 2- Un nuevo ataque para los Unathi, un ataque con la cola que empuja al otro una casilla hacia atrás. (O quizás que golpee a todo el mundo alrededor suyo y todo)
* 3- Los agarres de los Unathi son bien difíciles de resistir.
* 4- Los unathi pueden destrozar a mordiscos a quién tengan agarrados.
*/

// RALENTIZAMIENTO DE ARMADURAS

/datum/species
	// Esto son divisores
	var/clothing_slowdown_resistance = 1	// La ralentización causada por lo que se lleve equipado se divide por esto para que se reduzca
	var/item_slowdown_resistance = 1		// La ralentización causada por objetos no equipados (en las manos o en slot especiales)

/datum/species/unathi
	clothing_slowdown_resistance = 2		// Los unathi se ralentizan la mitad por la ropa
	item_slowdown_resistance = 2			// Los unathi se ralentizan la mitad por los objetos también.

/mob/living/carbon/human/movement_delay()
	var/tally = ..()

	if(species.slowdown)
		tally += species.slowdown

	if (istype(loc, /turf/space)) return -1 // It's hard to be slowed down in space by... anything

	if(embedded_flag || (stomach_contents && stomach_contents.len))
		handle_embedded_and_stomach_objects() //Moving with objects stuck in you can cause bad times.

	if(CE_SPEEDBOOST in chem_effects)
		return -1

	var/health_deficiency = (maxHealth - health)
	if(health_deficiency >= 40) tally += (health_deficiency / 25)

	if(can_feel_pain())
		if(getHalLoss() >= 10) tally += (getHalLoss() / 10) //halloss shouldn't slow you down if you can't even feel it

	if(istype(buckled, /obj/structure/bed/chair/wheelchair))
		for(var/organ_name in list(BP_L_HAND, BP_R_HAND, BP_L_ARM, BP_R_ARM))
			var/obj/item/organ/external/E = get_organ(organ_name)
			if(!E || E.is_stump())
				tally += 4
			else if(E.splinted)
				tally += 0.5
			else if(E.status & ORGAN_BROKEN)
				tally += 1.5
	else
		for(var/slot = slot_first to slot_last)
			var/obj/item/I = get_equipped_item(slot)
			if(I)
				// Añadiendo resistencia a la ralentización por especie - Sansaur - 18/06/2017  / species.item_slowdown_resistance
				// Obviamente, si no ralentiza, no se divide :3
				if(I.slowdown_general < 0)
					tally += I.slowdown_general
				else
					tally += I.slowdown_general / species.item_slowdown_resistance

				if(I.slowdown_per_slot[slot]  < 0)
					tally += I.slowdown_per_slot[slot]
				else
					tally += I.slowdown_per_slot[slot] / species.clothing_slowdown_resistance

		for(var/organ_name in list(BP_L_LEG, BP_R_LEG, BP_L_FOOT, BP_R_FOOT))
			var/obj/item/organ/external/E = get_organ(organ_name)
			if(!E || E.is_stump())
				tally += 4
			else if(E.splinted)
				tally += 0.5
			else if(E.status & ORGAN_BROKEN)
				tally += 1.5

	if(shock_stage >= 10) tally += 3

	if(aiming && aiming.aiming_at) tally += 5 // Iron sights make you slower, it's a well-known fact.

	if(FAT in src.mutations)
		tally += 1.5
	if (bodytemperature < 283.222)
		tally += (283.222 - bodytemperature) / 10 * 1.75

	tally += max(2 * stance_damage, 0) //damaged/missing feet or legs is slow

	if(mRun in mutations)
		tally = 0
	return (tally+config.human_delay)



// ATAQUE DE LA COLA (También añado el verbo de romper grabs aquí)

/datum/species/unathi
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/tail_swipe, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	// AÑADIDO ESTO - SANSAUR
	inherent_verbs = list(
		/mob/living/carbon/human/proc/aggressive_break_grab
		)
/datum/unarmed_attack/tail_swipe
	attack_verb = list("tail swipes")	// Empty hand hurt intent verb.
	attack_noun = list("tail")
	damage = 2						// Extra empty hand attack damage.
	attack_sound = "punch"
	miss_sound = 'sound/weapons/punchmiss.ogg'
	shredding = 0 // Calls the old attack_alien() behavior on objects/mobs when on harm intent.
	sharp = 0
	edge = 0
	deal_halloss = 0
	sparring_variant_type = /datum/unarmed_attack/light_strike

	// Vamos a hacer que al menos requieran tener el punto de apoyo de los pies para poder hacer la tail swipe
	// Si le faltan ambos pies, no podrán hacer tailswipe
	// Es el mismo condicionante que poder dar patadas
/datum/unarmed_attack/tail_swipe/is_usable(var/mob/living/carbon/human/user, var/mob/living/carbon/human/target, var/zone)
	if(!(zone in list(BP_L_LEG, BP_R_LEG, BP_L_FOOT, BP_R_FOOT, BP_GROIN, BP_CHEST)))
		return 0

	var/obj/item/organ/external/E = user.organs_by_name[BP_L_FOOT]
	if(E && !E.is_stump())
		return 1

	E = user.organs_by_name[BP_R_FOOT]
	if(E && !E.is_stump())
		return 1

	return 0

/datum/unarmed_attack/tail_swipe/apply_effects(var/mob/living/carbon/human/user,var/mob/living/carbon/human/target,var/armour,var/attack_damage,var/zone)
	// If (zone == BP_L_LEG, BP_L_FOOT, BP_R_LEG, BP_R_FOOT)
	// Hace lo mismo que un ataque normal, pero después de hacerlo, comprueba si el otro no está en el suelo
	// Si no está en el suelo, comprueba si estamos apuntando a las piernas
	// Si estamos apuntando a las piernas, habrá una chance de tirarle al suelo de sorpresa
	// Si no está apuntando a las piernas, se comprueba si está apuntando a la parte baja del cuerpo o al pecho
	// Si estamos apuntando a esas zonas, le empujamos una casilla hacia atrás (Un "Move")
	// Si el Move no fue correcto (Encontró pared o cosa densa) entonces el objetivo recibe daño adicional porque fue "lanzado contra una cosa densa"
	..()

	// Giramos después de que se compruebe que se pudo hacer el ataque
	user.spin(2,1)	// Es una tailswipe, ¿Porqué no girar? :D

	if(target.stat || target.resting) // Si está inconsciente/muerto, si está tirado en el suelo
		return
	// No podrá hacerle esto a los humanos grandes (Vox armalis, supongo)
	if(target.mob_size == MOB_LARGE)
		return
	if(attack_damage < 4)	// Si hace el daño mínimo, esto no funcionaría
		return

	switch(zone)
		if(BP_L_LEG, BP_L_FOOT, BP_R_LEG, BP_R_FOOT)
			user.visible_message("<span class='danger'>[user] managed to tail swipe [target]'s means to stability!</span>")
			target.Weaken(1)
		if(BP_CHEST, BP_GROIN)
			user.visible_message("<span class='danger'>[user] managed to tail swipe [target] backwards!</span>")
			// Tratamos de mover al objetivo una casilla hacia atrás.
			if(target.Move(get_step(target, user.dir)))
				// Pues se movió, no hay otra
				return
			else
				// Si no se puede, es que chocó contra algo!
				var/turf/T = get_step(target, user.dir)
				user.visible_message("<span class='danger'>[user] smacked [target] into [T]!</span>")
				target.adjustBruteLoss(attack_damage/2)	// Daño extra por empujar a alguien a la pared.


// AGARRES PARA LOS UNATHI
// Un proc que nos permita romper agarres haciéndonos daño de Halloss a nosotros mismos
/mob/living/carbon/human/proc/aggressive_break_grab()
	set category = "Abilities"
	set name = "Aggressive grab break"
	set desc = "Noone grabs you!."

	var/nutrition_limit = 150
	var/tiempo_CD = 40 // 40 segundos de cooldown, es más poderoso de lo que parece.
	// Special cooldown
	if(last_special > world.time)
		to_chat(src, "<span class='warning'> You still are exhausted from the last grab break!.</span>")
		return

	// Las esposas en este juego son místicas, así que vamos a dejar que lo sigan siendo.
	if(handcuffed || buckled)
		to_chat(src, "<span class='warning'> You cannot thrash around in your current status!.</span>")
		return

	// Hambre o heridas
	if(src.nutrition < nutrition_limit)	// Cambiar el 35 por una flag
		to_chat(src, "<span class='warning'> You're too tired to perform such an aggresive manouver!.</span>")
		return

	last_special = world.time + (tiempo_CD SECONDS)
	adjustHalLoss(10)	// 20 es demasiado trolete
//	playsound(src.loc, 'sound/voice/lizard.ogg', 50, 1) Pondremos un sonido que no sea este, por favor~
	src.spin(4,1)	// Un giro de poca duración muy rápido
	src.visible_message("<span class='danger'>[src] thrashes wildly around, breaking any grabs upon him!</span>")
	to_chat(src, "<span class=warning>Such aggressive movements have exhausted you.</span>")
	// Hay que añadir lo de los "pinned" pero es que tras hacer pruebas, parece que no funca del todo bien
	for(var/obj/item/weapon/grab/G in src.grabbed_by)
		qdel(G) 	// Esto hay que revisarlo, supuestamente el destroy ya lo hace, pero hay que ver
	src.resting = 0
	src.lying = 0
	src.AdjustParalysis(-4)
	src.AdjustStunned(-4)
	src.AdjustWeakened(-4)