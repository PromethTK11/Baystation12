/obj/parallax
	name = "parallax"
	mouse_opacity = 0
	blend_mode = BLEND_MULTIPLY
	plane = PARALLAX_PLANE
	invisibility = 101	// Revertir a 101 tras testeos - Sansaur
	anchored = 1
	var/mob/owner
	var/image/image

	New(mob/M)
		owner = M
		owner.parallax = src
		//icon = 'parallax.dmi'	// Quitar esto
		//icon_state = "space"	// Quitar esto
		//image(icon,loc,icon_state,layer,dir)
		image = image('parallax.dmi', src, "desat")
		image.invisibility = 0
		update()

	proc/update()
		forceMove(get_turf(owner))
		pixel_x = -224-owner.x
		pixel_y = -224-owner.y

	// Voy a dejar todos estos procs para que se pueda hacer debug en mitad de la partida - Sansaur
	proc/redo_image()
		owner << image

		// Este es el correcto.
	proc/debug_2()
		image = image('parallax.dmi', src, "space")
		owner << image
		// Este es el correcto.


/mob
	var/obj/parallax/parallax

/mob/Move()
	. = ..()
	if(parallax)
		parallax.update()

/mob/forceMove()
	. = ..()
	if(parallax)
		parallax.update()

/mob/Login()
	..()
	if(!parallax)
		parallax = new(src)
	src << parallax.image
