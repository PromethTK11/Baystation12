/*
Tajaran frontflip proof of concept

Design:

1) Using the inherent verbs, we'll create a proc that will be added to the Taajran
2) This allows him to move 3 squares in front of where he's facing, he'll be able to jump over tables in the positions 1 and 2


Possibilites:

1- Backflips too.

*/

/mob/living/carbon/human/proc/frontflip()
	set category = "Abilities"
	set name = "Front Flip"
	set desc = "Jump baby jump!."

	var/nutrition_limit = 130
	var/Tiempo_CD = 1
	// Special cooldown
	if(last_special > world.time)
		to_chat(src, "<span class='warning'> You've jumped too soon ago!.</span>")
		return

	if(!has_organ("l_leg") && !has_organ("r_leg"))
		to_chat(src, "<span class='warning'> You cannot jump without a leg!.</span>")
		return

	// Incapacitated / Buckled
	if(incapacitated(INCAPACITATION_DISABLED) || buckled || pinned.len)
		to_chat(src, "<span class='warning'> You cannot jump like this!.</span>")
		return

	// Hambre o heridas
	if(src.nutrition < nutrition_limit || health < 35)
		to_chat(src, "<span class='warning'> You're too tired to perform a frontflip!.</span>")
		return

	//Añadir tiempo de enfriamiento por armadura
	// +1 segundo por llevar traje
	// +2 segundos si es un traje espacial
	// +1 segundo si es armadura
	// +2 segundos si es armadura Y es armadura pesada.
	if(src.wear_suit)
		Tiempo_CD++
		if(istype(src.wear_suit, /obj/item/clothing/suit/space/rig))
			Tiempo_CD += 2
		if(istype(src.wear_suit, /obj/item/clothing/suit/armor))
			Tiempo_CD++
			var/obj/item/clothing/suit/armor/MYARMOR = src.wear_suit
			if(MYARMOR.w_class >= ITEM_SIZE_LARGE)
				Tiempo_CD += 2

	// Efecto
	// Cogemos la dirección en la que miramos, 1 = norte, 2 = sur, 4 = este, 8 = oeste
	// Comprobamos las 3 próximas casillas, una por una, si hay algo denso que no sea una mesa, se guarda la posición del choque
	// Se hace un efecto de girar al personaje y luego este aparece en la casilla objetivo.

	// ESTO SE PUEDE HACER DE MEJOR MANERA
	// CON UN LOOP


	// ¿Qué cosas densas se pueden saltar?
	var/list/JumpableTypes = list(
		/obj/structure/table,
		/obj/machinery/disposal,
		/obj/structure/closet,
		/obj/machinery/microscope,
		/obj/structure/morgue,
		/obj/structure/reagent_dispensers/water_cooler
	)


	var/turf/Casilla1 = get_step(src,src.dir)
	var/turf/Casilla2 = get_step(Casilla1,src.dir)
	var/turf/Casilla3 = get_step(Casilla2,src.dir)
	var/stuntime = 3

	if(Casilla1.density)
		playsound(src.loc, 'sound/weapons/genhit2.ogg', 50, 1)
		to_chat(src, "<span class='warning'> You crash into [Casilla1]!.</span>")
		src.Weaken(stuntime)
		last_special = world.time + (2 SECONDS)
		return
	else
		for(var/obj/OBJETO in Casilla1)
			if(OBJETO.density && !(is_type_in_list(OBJETO, JumpableTypes)))
				playsound(src.loc, 'sound/weapons/genhit2.ogg', 50, 1)
				to_chat(src, "<span class='warning'> You crash into [OBJETO]!.</span>")
				src.Weaken(stuntime)
				last_special = world.time + (2 SECONDS)
				return

	if(Casilla2.density)
		src.forceMove(Casilla1)
		playsound(src.loc, 'sound/weapons/genhit2.ogg', 50, 1)
		to_chat(src, "<span class='warning'> You crash into [Casilla2]!.</span>")
		src.Weaken(stuntime)
		last_special = world.time + (2 SECONDS)
		return
	else
		for(var/obj/OBJETO in Casilla2)
			if(OBJETO.density && !(is_type_in_list(OBJETO, JumpableTypes)))
				playsound(src.loc, 'sound/weapons/genhit2.ogg', 50, 1)
				src.forceMove(Casilla1)
				to_chat(src, "<span class='warning'> You crash into [OBJETO]!.</span>")
				src.Weaken(stuntime)
				last_special = world.time + (2 SECONDS)
				return

	if(Casilla3.density)
		src.forceMove(Casilla2)
		playsound(src.loc, 'sound/weapons/genhit2.ogg', 50, 1)
		to_chat(src, "<span class='warning'> You crash into [Casilla3]!.</span>")
		src.Weaken(stuntime)
		last_special = world.time + (2 SECONDS)
		return
	else
		for(var/obj/OBJETO in Casilla3)
			if(istype(OBJETO, /obj/machinery/disposal))
				var/obj/machinery/disposal/MYDISPOSAL = OBJETO
				to_chat(src, "<span class='warning'> You fall directly into [MYDISPOSAL]!.</span>")
				MYDISPOSAL.FallInto(src)
				return

			if(OBJETO.density && !(is_type_in_list(OBJETO, JumpableTypes)))
				playsound(src.loc, 'sound/weapons/genhit2.ogg', 50, 1)
				src.forceMove(Casilla2)
				to_chat(src, "<span class='warning'> You crash into [OBJETO]!.</span>")
				src.Weaken(stuntime)
				last_special = world.time + (2 SECONDS)
				return

	playsound(src.loc, 'sound/weapons/towelwipe.ogg', 50, 1)
	if(Tiempo_CD > 3)
		to_chat(src, "<span class='info'> [src] hardly frontflips towards [Casilla3]!.</span>")
	else
		to_chat(src, "<span class='info'> [src] frontflips towards [Casilla3]!.</span>")

	src.forceMove(Casilla3)
	last_special = world.time + (2 SECONDS)
	src.spin(2,0.6)	// Un giro de poca duración muy rápido
	dejar_rastro(Casilla1)
	dejar_rastro(Casilla2)
	animate_spin(src, "L", 1.3)

// ¡Una nueva proc para los disposals para que el Tajaran pueda saltar adentro!
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

// PORT DE UNA ANIMACIÓN DE PARADISE
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

// Una nueva animación para los Mobs, permitiéndooles dejar un rastro negro antropomórfico.
/mob/proc/dejar_rastro(var/turf/T)
	if(!T)
		return

//	playsound(T, 'sound/effects/phasein.ogg', 25, 1)
//	playsound(T, 'sound/effects/sparks2.ogg', 50, 1)
	anim(T,src,'rastro.dmi',,"rastro",,dir)