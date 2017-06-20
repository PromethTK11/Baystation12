/*
Tajaran frontflip proof of concept

Design:

1) Using the inherent verbs, we'll create a proc that will be added to the Taajran
2) This allows him to move 3 squares in front of where he's facing, he'll be able to jump over determinate dense objects in the whole trajectory
3) Can crash against walls and dense objects by checking if a dense object or a dense turf is in it's way, if it is, it'll stop in the tile before it.

Possibilites:

1- Backflips too.

*/

/mob/living/carbon/human/proc/frontflip()
	set category = "Abilities"
	set name = "Front Flip"
	set desc = "Jump baby jump!."

	var/nutrition_limit = 150
	var/Tiempo_CD = 3
	var/casillas_a_avanzar = 3
	var/stuntime = 3	// Cuanto tiempo aturdido

	// Special cooldown
	if(last_special > world.time)
		to_chat(src, "<span class='warning'> You've jumped too soon ago!.</span>")
		return

	// No podemos saltar desde algo que no sea un suelo. (Nada de saltar desde lockers cerrados)
	if(!isturf(src.loc))
		return

	// Incapacitated / Buckled
	if(incapacitated(INCAPACITATION_DISABLED) || buckled || pinned.len)
		to_chat(src, "<span class='warning'> You cannot jump like this!.</span>")
		return

	// Hambre o heridas
	if(src.nutrition < nutrition_limit || health < 35)	// Cambiar el 35 por una flag
		to_chat(src, "<span class='warning'> You're too tired to perform a frontflip!.</span>")
		return

	//A�adir tiempo de enfriamiento por armadura
	// +1 segundo por llevar traje
	// +2 segundos si es un traje espacial
	// +1 segundo si es armadura
	// +4 segundos si es armadura Y es armadura pesada. (Comprobado que por muchos 8 segundos que sean, sigue siendo muy trol, subiendo a 10 al menos)
	if(src.wear_suit)
		Tiempo_CD++
		if(istype(src.wear_suit, /obj/item/clothing/suit/space))
			Tiempo_CD += 2
		if(istype(src.wear_suit, /obj/item/clothing/suit/armor))
			Tiempo_CD++
			var/obj/item/clothing/suit/armor/MYARMOR = src.wear_suit
			if(MYARMOR.w_class >= ITEM_SIZE_LARGE)
				Tiempo_CD += 4

	// Efecto
	// Cogemos la direcci�n en la que miramos, 1 = norte, 2 = sur, 4 = este, 8 = oeste
	// Comprobamos las 3 pr�ximas casillas, una por una, si hay algo denso que no sea una mesa, se guarda la posici�n del choque
	// Se hace un efecto de girar al personaje y luego este aparece en la casilla objetivo.

	// �Qu� cosas densas se pueden saltar?
	var/list/JumpableTypes = list(
		/obj/structure/table,
		/obj/machinery/disposal,
		/obj/structure/closet,
		/obj/machinery/microscope,
		/obj/structure/morgue,
		/obj/structure/reagent_dispensers/water_cooler
	)
	var/turf/Casilla = src.loc
	for(var/i=0, i<casillas_a_avanzar, i++)
		Casilla = get_step(Casilla, src.dir)
		if(Casilla.density)
			playsound(src.loc, 'sound/weapons/genhit2.ogg', 50, 1)
			to_chat(src, "<span class='warning'> You crash into [Casilla]!.</span>")
			src.Weaken(stuntime)
			last_special = world.time + (Tiempo_CD SECONDS)
			adjustHalLoss(5)
			return
		else
			// Y no voy a poner a los robots porque est� divertido que haya algo que los trolee xd

			for(var/mob/living/carbon/human/Bloqueador in Casilla)
				if(Bloqueador.a_intent != I_HELP)	// Si pasa por un humano que no le quiera dejar pasar (Siguiendo las normas de Bumps en movimiento) le bloquear�
					//playsound(src.loc, 'sound/weapons/genhit2.ogg', 50, 1)
					to_chat(src, "<span class='warning'> [Bloqueador] stops you!.</span>")
					to_chat(Bloqueador, "<span class='warning'> you stop [src] as it tries to jump over you!.</span>")
					//src.Weaken(stuntime) // No te aturden por bloquearte
					last_special = world.time + (Tiempo_CD SECONDS)
					adjustHalLoss(5)
					return

			for(var/obj/OBJETO in Casilla)
				if(OBJETO.density && !(is_type_in_list(OBJETO, JumpableTypes)))
					playsound(src.loc, 'sound/weapons/genhit2.ogg', 50, 1)
					to_chat(src, "<span class='warning'> You crash into [OBJETO]!.</span>")
					src.Weaken(stuntime)
					last_special = world.time + (Tiempo_CD SECONDS)
					adjustHalLoss(5)
					return

				if(i==(casillas_a_avanzar-1)) // cosas especiales que pueden ocurrir en la tercera casilla
					if(istype(OBJETO, /obj/machinery/disposal))	// Caer dentro de un disposal
						var/obj/machinery/disposal/MYDISPOSAL = OBJETO
						to_chat(src, "<span class='warning'> You fall directly into [MYDISPOSAL]!.</span>")
						MYDISPOSAL.FallInto(src)
						adjustHalLoss(5)
						return

		dejar_rastro(Casilla)
		src.forceMove(Casilla)
		sleep(1)

	playsound(src.loc, 'sound/weapons/towelwipe.ogg', 50, 1)
	if(Tiempo_CD > 4)
		// Mucho  da�o por saltar con armadura pesada
		adjustHalLoss(15)
		to_chat(src, "<span class='info'> [src] hardly frontflips towards [Casilla]!.</span>")
	else
		// Muy poco da�o por saltar sin armadura pesada y que no te bloqueen
		adjustHalLoss(3)
		to_chat(src, "<span class='info'> [src] frontflips towards [Casilla]!.</span>")

	// Si no funciona lo del "sleep(1)" cambiarlo por poner �nicamente
	// src.forceMove(Casilla3)
	src.forceMove(Casilla1)
	sleep(1)
	src.forceMove(Casilla2)
	sleep(1)
	src.forceMove(Casilla3)
	last_special = world.time + (Tiempo_CD SECONDS)
	src.spin(2,0.6)	// Un giro de poca duraci�n muy r�pido

	dejar_rastro(Casilla1)
	dejar_rastro(Casilla2)
	animate_spin(src, "L", 1.3) // Flip de Goonstation

// �Una nueva proc para los disposals para que el Tajaran pueda saltar adentro!
// B�sicamente es lo mismo que tirar a alguien adentro, pero instant�neo.
/obj/machinery/disposal/proc/FallInto(mob/user)
	if(user.stat || !user.canmove || !istype(user))
		return

	src.add_fingerprint(user)
	var/msg = "<span class='warning'> [user] falls directly into [src]! </span>"

	if (user.client)
		user.client.perspective = EYE_PERSPECTIVE
		user.client.eye = src

	user.forceMove(src)

	for (var/mob/C in viewers(src))
		if(C == user)
			continue
		C.show_message(msg, 3)

	update_icon()
	return

// PORT DE UNA ANIMACI�N DE PARADISE
	// NO SE HACE LOOP >:C
/proc/animate_spin(var/atom/A, var/dir = "L", var/T = 1, var/looping = 0)
	if(!istype(A))
		return

	var/matrix/M = A.transform
	var/turn = -90
	if(dir == "R")
		turn = 90

	animate(A, transform = matrix(M, turn, MATRIX_ROTATE | MATRIX_MODIFY), time = T, loop = looping)
	animate(transform = matrix(M, turn, MATRIX_ROTATE | MATRIX_MODIFY), time = T, loop = looping)
	animate(transform = matrix(M, turn, MATRIX_ROTATE | MATRIX_MODIFY), time = T, loop = looping)
	animate(transform = matrix(M, turn, MATRIX_ROTATE | MATRIX_MODIFY), time = T, loop = looping)

// Una nueva animaci�n para los Mobs, permiti�ndooles dejar un rastro negro antropom�rfico.
/mob/proc/dejar_rastro(var/turf/T)
	if(!T)
		return

//	playsound(T, 'sound/effects/phasein.ogg', 25, 1)
//	playsound(T, 'sound/effects/sparks2.ogg', 50, 1)
	anim(T,src,'rastro.dmi',,"rastro",,dir)


/***

LA PRUEBA DE CONCEPTO PARA QUE LOS TAJARAN NECSITEN DORMIR

Un handle_enviroment_special con una variable nueva dentro de la especie.

A�adimos bastantes variables adicionales a la especie Tajaran

- Sansaur

***/


/datum/species/tajaran
	var/need_for_sleep = 0
	var/sleep_regen_rate = 10
	var/sleep_increase_rate = 1
	var/sleep_decrease_rate = 2		// Cuanto de sue�o se quita mientras tomas caf�
	var/maximum_sleep = 100			// Cuanto sue�o se puede acumular
	var/sleep_increase_chance = 3	// Cuanto m�s alto es este n�mero, antes se ir�n a dormir. Entre 1 y 100 de posibilidad, por favor - sansaur
	var/sleeping_time = 30			// Cuanto tiempo se les pone a dormir

// Necesitan dormir
// �Se podr�a hacer en algo que no fuera handle_enviroment_special? Probablemente
/*
	Cosas a a�adir:
	1) Chequeos de donde "pueden caer inconscientes a dormir"
	2) Buscar una manera de que no puedan dormir mientras est�n en medio de una pelea, si es que eso se puede comprobar
	3)
*/
/datum/species/tajaran/handle_environment_special(var/mob/living/carbon/human/H)
	handle_sleep_time(H) // Lo ponemos en otra Proc para que se puedan hacer m�s cosas en el mismo handle_enviroment_special

/datum/species/tajaran/proc/handle_sleep_time(var/mob/living/carbon/human/H)
	// Tambi�n se reduce la necesidad de dormir con otras sustancias.
	var/list/ReagentsQueQuitanSuenio = list(
		/datum/reagent/drink/coffee,
		/datum/reagent/drink/tea,
		/datum/reagent/sugar
	)
	if(H.ingested)
		var/datum/reagents/metabolism/METABOLISMO = H.ingested
		if(METABOLISMO.reagent_list.len)
			for(var/datum/reagent/COMPROBANDO in METABOLISMO.reagent_list)
				if(is_type_in_list(COMPROBANDO, ReagentsQueQuitanSuenio))
					need_for_sleep -= sleep_decrease_rate
					if(need_for_sleep < 0)
						need_for_sleep = 0
					if(prob(3))
						to_chat(H, "<span class='info'> You don't feel as sleepy as before </span>")

	// Si ya estamos durmiendo, se reduce y se acaba el handle enviroment special
	if(H.sleeping)
		need_for_sleep -= sleep_regen_rate
		if(need_for_sleep < 0)
			need_for_sleep = 0
		return

	if(prob(sleep_increase_chance))
		need_for_sleep += sleep_increase_rate
		if(need_for_sleep > (maximum_sleep / 2))
			if(prob(10))
				to_chat(H, "<span class=info> You're feeling kinda sleepy... </span>")

		if(need_for_sleep > (maximum_sleep / 1.2))
			if(prob(10))
				to_chat(H, "<span class=info> You really should go to sleep now... </span>")
				H.emote("yawn")

		if(need_for_sleep > maximum_sleep)
			to_chat(H, "<span class=warning> You fall onto [H.loc] exhausted, you really need a quick nap at least... </span>")
			for (var/mob/C in viewers(H))
				if(C == H)
					continue
				C.show_message("<span class=warning> [H] falls flat onto [H.loc] and begins to sleep soundly </span>")

			H.sleeping += sleeping_time
