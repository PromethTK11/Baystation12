/*
* Adiciones para los Unathi (Posibles):
*
* 1- Que los Unathi no se ralenticen con lo de llevar armaduras, o que al menos se ralenticen la mitad
* 2- Un nuevo ataque para los Unathi, un ataque con la cola que empuja al otro una casilla hacia atr�s. (O quiz�s que golpee a todo el mundo alrededor suyo y todo)
* 3- Los agarres de los Unathi son bien dif�ciles de resistir.
* 4- Los unathi pueden destrozar a mordiscos a qui�n tengan agarrados.
*/

// RALENTIZAMIENTO DE ARMADURAS

/datum/species
	// Esto son divisores
	// 0 = No tiene resistencia a la ralentizaci�n
	// 1 = Resistencia a la ralentizaci�n incre�ble	(100% de lo ralentizado se quita)
	// 2 = Resistencia a la ralentizaci�n Unathi	(50% de lo ralentizado se quita)
	// 3 = Resistencia a la ralentizaci�n normalita	(33% de lo ralentizado se quita)
	// No se puede poner una a un n�mero y la otra a 0. O las dos con un n�mero, o las dos en 0
	var/clothing_slowdown_resistance = 0	// La ralentizaci�n causada por lo que se lleve equipado se divide por esto para que se reduzca
	var/item_slowdown_resistance = 0		// La ralentizaci�n causada por objetos no equipados (en las manos o en slot especiales)

/datum/species/unathi
	clothing_slowdown_resistance = 2		// Los unathi se ralentizan la mitad por la ropa
	item_slowdown_resistance = 2			// Los unathi se ralentizan la mitad por los objetos tambi�n.

/*

En vez de ponerlo aqu�, voy a cambiar el archivo human_movement.dm Y poner la funci�n importante ah�
ACTUALLY eso es MUY MUERTE porque entonces se podr�a hacer el include del human_movement y NO DE ESTO.

RECUERDEN, SI SE HACE PR QUE CAMBIE HUMAN_MOVEMENT VA A HABER MUERTECITA

*/

// Vale, lo que vamos a hacer aqu� es lo siguiente:
// 0) Si tanto la resistencia a la ropa como a los objetos es 0, no hace falta.
// 1) Repasamos de nuevo todos los objetos del inventario
// 2) Sumamos toda la ralentizaci�n que dan, divimos esta por la resistencia a la ralentizaci�n de la especie
// 3) La dividimos
/mob/living/carbon/human/movement_delay()
	if(!species.item_slowdown_resistance && !species.clothing_slowdown_resistance)
		return ..()
	else
		var/tally = ..()
		var/resistir_ropa	= 0
		var/resistir_objetos = 0

		for(var/slot = slot_first to slot_last)
			var/obj/item/I = get_equipped_item(slot)
			if(I)
				if(I.slowdown_general < 0)
					// Nada
				else
					if(species.item_slowdown_resistance)
						resistir_objetos += I.slowdown_general / species.item_slowdown_resistance

				if(I.slowdown_per_slot[slot]  < 0)
					// Nada
				else
					if(species.clothing_slowdown_resistance)
						resistir_ropa += I.slowdown_per_slot[slot] / species.clothing_slowdown_resistance
		// Debugging
		//to_chat(src, "Ralentiazacion original [tally], resistiendo ropa: [resistir_ropa], resistiendo objetos: [resistir_objetos], final: [(tally-resistir_objetos-resistir_ropa)]")
		return (tally-resistir_objetos-resistir_ropa)


// ATAQUE DE LA COLA (Tambi�n a�ado el verbo de romper grabs aqu�)

/datum/species/unathi
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/tail_swipe, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	// A�ADIDO ESTO - SANSAUR
	inherent_verbs = list(
		/mob/living/carbon/human/proc/aggressive_break_grab
		)

/datum/unarmed_attack/tail_swipe
	attack_verb = list("tail swipes")	// Empty hand hurt intent verb.
	attack_noun = list("tail")
	damage = 1						// 1 puntito de da�o extra.
	attack_sound = "punch"
	miss_sound = 'sound/weapons/punchmiss.ogg'
	shredding = 0 // Calls the old attack_alien() behavior on objects/mobs when on harm intent.
	sharp = 0
	edge = 0
	deal_halloss = 0
	sparring_variant_type = /datum/unarmed_attack/light_strike

	// Vamos a hacer que al menos requieran tener el punto de apoyo de los pies para poder hacer la tail swipe
	// Si le faltan ambos pies, no podr�n hacer tailswipe
	// Es el mismo condicionante que poder dar patadas
/datum/unarmed_attack/tail_swipe/is_usable(var/mob/living/carbon/human/user, var/mob/living/carbon/human/target, var/zone)
	if(!(zone in list(BP_L_LEG, BP_R_LEG, BP_GROIN, BP_CHEST)))
		return 0

	var/obj/item/organ/external/E = user.organs_by_name[BP_L_FOOT]
	if(E && !E.is_stump())
		return 1

	E = user.organs_by_name[BP_R_FOOT]
	if(E && !E.is_stump())
		return 1

	return 0

/datum/unarmed_attack/tail_swipe/apply_effects(var/mob/living/carbon/human/user,var/mob/living/carbon/human/target,var/armour,var/attack_damage,var/zone)
	// Hace lo mismo que un ataque normal, pero despu�s de hacerlo, comprueba si el otro no est� en el suelo
	// Si no est� en el suelo, comprueba si estamos apuntando a las piernas
	// Si estamos apuntando a las piernas, habr� una chance de tirarle al suelo de sorpresa <- ELIMINADO
	// Si no est� apuntando a las piernas, se comprueba si est� apuntando a la parte baja del cuerpo o al pecho
	// Si estamos apuntando a esas zonas, le empujamos una casilla hacia atr�s (Un "Move")
	// Si el Move no fue correcto (Encontr� pared o cosa densa) entonces el objetivo recibe da�o adicional porque fue "lanzado contra una cosa densa"
	..()

	user.spin(4,1)	// Es una tailswipe, �Porqu� no girar? :D

	if(target == user) //No te puedes hacer tailswipes a ti mismo
		return

	if(target.stat || target.resting) // Si est� inconsciente/muerto, si est� tirado en el suelo
		return
	// No podr� hacerle esto a los humanos grandes (Vox armalis, supongo)
	if(target.mob_size == MOB_LARGE)
		return
	if(attack_damage < 4)	// Si hace el da�o m�nimo, esto no funcionar�a
		return

	switch(zone)
		if(BP_L_LEG, BP_R_LEG)
			if(prob(10))
				user.visible_message("<span class='danger'>[user] managed to tail swipe [target]'s means to stability!</span>")
				target.spin(2,1)
				// �En serio no hay una proc para esto? xD - Sansaur
				// Mira, por ahora, esto es demasiado peligroso
				//target.m_intent = "walk"
				//target.hud_used.move_intent.icon_state = "walking"

		if(BP_CHEST, BP_GROIN)
			var/obj/item/clothing/suit/TRAJE = target.wear_suit
			if(TRAJE)
				// Si es un traje GRANDE y tiene una armadura MELEE superior a 30 es que es algo que se supone que tiene que proteger y eso impedir�a que le empujen.
				if(TRAJE.w_class >= 4 && TRAJE.armor["melee"] > 30)
					return

			if(prob(30))
				user.visible_message("<span class='danger'>[user] struck [target] with enough force to send'em backwards!</span>")
				// Tratamos de mover al objetivo una casilla hacia atr�s.
				if(target.Move(get_step(target, user.dir)))
					// Pues se movi�, no hay otra
					return
				else
					// Si no se puede, es que choc� contra algo!
					// En un futuro se puede mejorar el tema para que haya efectos adicionales al empujar a alguien contra una pared u objeto
					// var/turf/T = get_step(target, user.dir)
					user.visible_message("<span class='danger'>[user] smacked [target] into something solid!</span>")
					target.adjustBruteLoss(attack_damage/2)	// Da�o extra por empujar a alguien a la pared.


// AGARRES PARA LOS UNATHI
// Un proc que nos permita romper agarres haci�ndonos da�o de Halloss a nosotros mismos
/mob/living/carbon/human/proc/aggressive_break_grab()
	set category = "Abilities"
	set name = "Aggressive grab break"
	set desc = "Noone grabs you!."

	var/nutrition_limit = 150
	var/tiempo_CD = 45 // 45 segundos de cooldown, es m�s poderoso de lo que parece.
	// Special cooldown
	if(last_special > world.time)
		to_chat(src, "<span class='warning'> You still are exhausted from the last grab break!.</span>")
		return

	// Las esposas en este juego son m�sticas, as� que vamos a dejar que lo sigan siendo.
	if(handcuffed || buckled)
		to_chat(src, "<span class='warning'> You cannot thrash around in your current status!.</span>")
		return

	// Hambre o heridas
	if(src.nutrition < nutrition_limit)	// Cambiar el 35 por una flag
		to_chat(src, "<span class='warning'> You're too tired to perform such an aggresive manouver!.</span>")
		return

	last_special = world.time + (tiempo_CD SECONDS)
	adjustHalLoss(15)	// 20 es demasiado trolete y 10 es demasiado poco
	playsound(src.loc, 'lizardshort.ogg', 50, 1)
	src.spin(8,1)	// Un giro de larga duraci�n muy r�pido
	src.visible_message("<span class='danger'>[src] thrashes wildly around, breaking any grabs upon him!</span>")
	to_chat(src, "<span class=warning>Such aggressive movements have exhausted you.</span>")
	// Hay que a�adir lo de los "pinned" pero es que tras hacer pruebas, parece que no funca del todo bien
	for(var/obj/item/weapon/grab/G in src.grabbed_by)
		qdel(G) 	// Esto hay que revisarlo, supuestamente el destroy ya lo hace, pero hay que ver
	src.resting = 0
	src.lying = 0
	src.AdjustParalysis(-4)
	src.AdjustStunned(-4)
	src.AdjustWeakened(-4)