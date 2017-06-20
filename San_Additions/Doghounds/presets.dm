
/mob/living/silicon/robot/doggoborg/scrubpup
	lawupdate = 0
	scrambledcodes = 1
	modtype = "Custodial Hound module"
	module = /obj/item/weapon/robot_module/scrubpup
	spawn_sound = 'RobotDog.ogg'
	cell = /obj/item/weapon/cell/standard
	pitch_toggle = 0

/mob/living/silicon/robot/doggoborg/scrubpup/New()
	src.icon 		 = 'widerobot_vr.dmi'
	if(src.hands)
		src.hands.icon = 'screen1_robot_vr.dmi'
	src.icon_state = "scrubpup"
	src.pixel_x 	 = 0
	..()


/mob/living/silicon/robot/doggoborg/ert_doggo
	lawupdate = 0
	scrambledcodes = 1
	modtype = "Emergency Responce Hound module"
	module = /obj/item/weapon/robot_module/ert
	spawn_sound = 'RobotDogLow.ogg'
	cell = /obj/item/weapon/cell/super
	pitch_toggle = 0

/mob/living/silicon/robot/doggoborg/ert_doggo/New()
	src.icon 		 = '62x62robot_vr.dmi'
	if(src.hands)
		src.hands.icon = 'screen1_robot_vr.dmi'
	src.pixel_x 	 = 0
	..()


/mob/living/silicon/robot/doggoborg/knine
	lawupdate = 0
	scrambledcodes = 1
	modtype = "K9 unit module"
	module = /obj/item/weapon/robot_module/knine
	spawn_sound = 'RobotDog.ogg'
	cell = /obj/item/weapon/cell/standard
	pitch_toggle = 0

/mob/living/silicon/robot/doggoborg/knine/New()
	src.icon 		 = 'widerobot_vr.dmi'
	if(src.hands)
		src.hands.icon = 'screen1_robot_vr.dmi'
	src.icon_state = "k9"
	src.pixel_x 	 = 0
	..()


/mob/living/silicon/robot/doggoborg/medihound
	lawupdate = 0
	scrambledcodes = 1
	modtype = "Medihound module"
	module = /obj/item/weapon/robot_module/medihound
	spawn_sound = 'RobotDog.ogg'
	cell = /obj/item/weapon/cell/standard
	pitch_toggle = 0

/mob/living/silicon/robot/doggoborg/medihound/New()
	src.icon = 'widerobot_vr.dmi'
	if(src.hands)
		src.hands.icon = 'screen1_robot_vr.dmi'
	src.icon_state = "medihound"
	src.pixel_x 	 = 0
	..()
