/*
	The idea is to make a "rectangle" behind the person.
	In this rectangle masks are applied

	Possible changes:

	- Make Cyborgs able to see behind their backs
	- Make the field of view be a cone behind you.

	BUGS:

	- If you have no client (Mob is being ghosted) and then someone moves behind you, if the ghost returns to the mob, he'll be able to see what's behind.

*/

var/global/list/living_types_can_see_behind = list(	/mob/living/silicon,
													/mob/living/deity,
													/mob/living/bot)

/mob/living
	var/image/BLACKOVERLAY

/mob/living/Move()
	..()
	Tell_Me_Dir_MOBS()
	for(var/mob/living/VISIBLE in oview())
		VISIBLE.Tell_Me_Dir_MOBS()

/mob/living/forceMove()
	..()
	Tell_Me_Dir_MOBS()
	for(var/mob/living/VISIBLE in oview())
		VISIBLE.Tell_Me_Dir_MOBS()

/mob/living/face_atom(var/atom/A)
	..(A)
	Tell_Me_Dir_MOBS()

/mob/living/facedir(var/ndir)
	..(ndir)
	Tell_Me_Dir_MOBS()

/mob/living/proc/Tell_Me_Dir_MOBS()
	// Having a client is REQUIRED for this to work
	if(!src.client)
		return
	if(is_type_in_list(src, living_types_can_see_behind))
		return
	if(istype(src, /mob/living/carbon/human))
		var/mob/living/carbon/human/CHECK = src
		if(CHECK.species)
			if(istype(CHECK.species, /datum/species/xenos))
				return

	if(dir == SOUTH)
		for(var/mob/living/VISIBLE in oview())
			if(VISIBLE.y <= (src.y+1) && !(VISIBLE.y < src.y - src.client.view))
				VISIBLE.HideMask(client)
			else
				VISIBLE.ShowMask(client)

	if(dir == NORTH)
		for(var/mob/living/VISIBLE in oview())
			if(VISIBLE.y >= (src.y-1) && !(VISIBLE.y > src.y + src.client.view))
				VISIBLE.HideMask(client)
			else
				VISIBLE.ShowMask(client)

	if(dir == EAST)
		for(var/mob/living/VISIBLE in oview())
			if(VISIBLE.x >= (src.x-1) && !(VISIBLE.x > src.x + src.client.view))
				VISIBLE.HideMask(client)
			else
				VISIBLE.ShowMask(client)

	if(dir == WEST)
		for(var/mob/living/VISIBLE in oview())
			if(VISIBLE.x <= (src.x+1) && !(VISIBLE.x < src.x - src.client.view))
				VISIBLE.HideMask(client)
			else
				VISIBLE.ShowMask(client)


/mob/living
	var/obj/fov_test/fov_test

/mob/living/Move()
	. = ..()
	if(fov_test)
		fov_test.update()

/mob/living/forceMove()
	. = ..()
	if(fov_test)
		fov_test.update()

/mob/living/face_atom(var/atom/A)
	..(A)
	if(fov_test)
		fov_test.update()

/mob/living/facedir(var/ndir)
	..(ndir)
	if(fov_test)
		fov_test.update()

/mob/living/Login()
	..()
	// Adding the overlay
	if(is_type_in_list(src, living_types_can_see_behind))
		return

	if(istype(src, /mob/living/carbon/human))
		var/mob/living/carbon/human/CHECK = src
		if(CHECK.species)
			if(istype(CHECK.species, /datum/species/xenos))
				return

	if(!fov_test)
		fov_test = new(src)
	src << fov_test.image

/obj/fov_test
	name = "item attached to the back of the person"
	mouse_opacity = 0
	blend_mode = BLEND_MULTIPLY
	plane = FULLSCREEN_PLANE
	invisibility = 101	// Revertir a 101 tras testeos - Sansaur
	anchored = 1
	var/mob/living/owner
	var/image/image

	New(mob/living/M)
		owner = M
		owner.fov_test = src
		image = image('Testing.dmi', src, "overlay2")
		image.invisibility = 0
		update()

	proc/update()
		forceMove(get_turf(owner))
		pixel_x = -224
		pixel_y = -224
		dir = owner.dir

		// Este es el correcto.
	proc/debug_2()
		image = image('Testing.dmi', src, "overlay2")
		owner << image
		// Este es el correcto.







	/*
/mob/living/handle_vision()
	update_sight()

	if(stat == DEAD)
		return

	if(eye_blind)
		overlay_fullscreen("blind", /obj/screen/fullscreen/blind)
	else
		clear_fullscreen("blind")
		set_fullscreen(disabilities & NEARSIGHTED, "impaired", /obj/screen/fullscreen/impaired, 1)
		set_fullscreen(eye_blurry, "blurry", /obj/screen/fullscreen/blurry)
		set_fullscreen(druggy, "high", /obj/screen/fullscreen/high)

	if(machine)
		var/viewflags = machine.check_eye(src)
		if(viewflags < 0)
			reset_view(null, 0)
		else if(viewflags)
			set_sight(viewflags)
	else if(eyeobj)
		if(eyeobj.owner != src)
			reset_view(null)
	else if(!client.adminobs)
		reset_view(null)

/mob/living/update_living_sight()
	set_sight(sight&(~(SEE_TURFS|SEE_MOBS|SEE_OBJS))) // This doesn't work because of this <- SEE_MOBS is hardcoded
	set_see_in_dark(initial(see_in_dark))
	set_see_invisible(initial(see_invisible))

	*/


/*
	CODE MADE BY F0lak
	http://www.byond.com/forum/?post=1845070

*/

atom/movable
	var/mask/mask

	proc/HideMask(client/c) // Hides the mask image, making the object visible to a certain client
		if(!c || !mask)
			return
		// debug info to make testing and bug fixing easier if we screw up implementation
		if(!istype(c, /client)) CRASH("Invalid client([c]) in [src].HideMask()")

		c.RemoveMask(mask.mask_image)

	proc/ShowMask(client/c) // Create a mask if it doesn't exist, making the object invisible to a certain client
		if(!c)
			return

        // debug info to make testing and bug fixing easier if we screw up implementation
		if(!istype(c, /client)) CRASH("Invalid client([c]) in [src].ShowMask()")

        // recycle the image for multiple clients
		if(!mask)
			mask = new/mask(src, c)

		c.AddMask(mask.mask_image)

image/mask

mask

	var/image/mask/mask_image  // a unique path to make synching client.images easier

	New(atom/movable/am, client/c)

        // debug info to make testing and bug fixing easier if we screw up implementation
		if(!istype(c, /client)) CRASH("Invalid client([c]) in new /mask([am], [c])")

        // create a new mask image, this lets us 'cover up' or 'hide' each object individually
		mask_image = new(icon = null, loc = am)
		mask_image.override = 1


client
    var masks[]

    New()
        ..()
        masks = new

    // Various client procs to handle the masks

    proc/SyncMasks()  // Synchs the masks list with images list and cleans up un-needed masks
        images.Remove(masks)
        for(var/image/mask/i in images)
            images.Remove(i)
        images.Add(masks)


    proc/AddMask(image/i)  // Adds a mask to masks list and synchs images
        if(!(i in masks))
            masks.Add(i)
            SyncMasks()

    proc/RemoveMask(image/i)  // Removes a mask to masks list and synchs images
        if(masks.Remove(i))
            SyncMasks()

    proc/ClearMasks()  // Clears all masks from the client and synchs
        masks = list()
        SyncMasks()


/*
mob
    verb
        // Some verbs to test implementation
        Mask_Item(atom/movable/m in view())

            m.ShowMask(client)


        Unmask(atom/movable/m in view())

            m.HideMask(client)

        ClearMasks()

            client.ClearMasks()
*/