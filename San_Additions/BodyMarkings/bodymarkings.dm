
/*
////////////////////////////
/  =--------------------=  /
/  ==  Body Markings   ==  /
/  =--------------------=  /
////////////////////////////
*/
/datum/sprite_accessory
	// If only this ckey can get this body marking to show on their list of bodymarkings
	// Don't init here
	var/list/ckey_allowed

/datum/sprite_accessory/marking
	icon = 'bodymarkings.dmi'
	do_colouration = 1 //Almost all of them have it, COLOR_ADD

	//Empty list is unrestricted. Should only restrict the ones that make NO SENSE on other species,
	//like Tajara inner-ear coloring overlay stuff.
	species_allowed = list()

	var/body_parts = list() //A list of bodyparts this covers, in organ_tag defines
	//Reminder: BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_CHEST,BP_GROIN,BP_HEAD


	// TATTOOS
	// WORN BY HUMANS
	tat_heart
		name = "Tattoo (Heart, Torso)"
		icon_state = "tat_heart"
		body_parts = list(BP_CHEST)
		species_allowed = list("Human")

	tat_heart
		name = "Tattoo (Heart, Torso, Centered)"
		icon_state = "tat_heart_center"
		body_parts = list(BP_CHEST)
		species_allowed = list("Human")

	tat_hive
		name = "Tattoo (Hive, Back)"
		icon_state = "tat_hive"
		body_parts = list(BP_CHEST)
		species_allowed = list("Human")

	tat_nightling
		name = "Tattoo (Nightling, Back)"
		icon_state = "tat_nightling"
		body_parts = list(BP_CHEST)
		species_allowed = list("Human")

	tat_campbell
		name = "Tattoo (Campbell, R.Arm)"
		icon_state = "tat_campbell"
		body_parts = list(BP_R_ARM)
		species_allowed = list("Human")

	tat_tiger
		name = "Tattoo (Tiger Stripes, Body)"
		icon_state = "tiger"
		body_parts = list(BP_CHEST,BP_GROIN)
		species_allowed = list("Human")

	tat_tiger_l_arm
		name = "Tattoo (Tiger Stripes, left arm)"
		icon_state = "tiger"
		body_parts = list(BP_L_ARM)
		species_allowed = list("Human")

	tat_tiger_r_arm
		name = "Tattoo (Tiger Stripes, right arm)"
		icon_state = "tiger"
		body_parts = list(BP_R_ARM)
		species_allowed = list("Human")

	tat_tiger_l_leg
		name = "Tattoo (Tiger Stripes, left leg)"
		icon_state = "tiger"
		body_parts = list(BP_L_LEG, BP_L_FOOT)
		species_allowed = list("Human")

	tat_tiger_r_leg
		name = "Tattoo (Tiger Stripes, right leg)"
		icon_state = "tiger"
		body_parts = list(BP_R_LEG, BP_R_FOOT)
		species_allowed = list("Human")

	tat_tiger_head
		name = "Tattoo (Tiger Stripes Head, Minor)"
		icon_state = "tigerhead"
		body_parts = list(BP_HEAD)
		species_allowed = list("Human")

	yakuza_tattoo
		name = "Tattoo (Yakuza, Chest)"
		icon_state = "yakuza"
		body_parts = list(BP_CHEST)
		species_allowed = list("Human")

	bands
		name = "Color Bands"
		icon_state = "bands"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_CHEST,BP_GROIN)
		species_allowed = list("Human")

	bandsface
		name = "Color Bands (Face)"
		icon_state = "bandsface"
		body_parts = list(BP_HEAD)
		species_allowed = list("Human")



	//Taj specific stuff
	taj_belly
		name = "Belly Fur (Taj)"
		icon_state = "taj_belly"
		body_parts = list(BP_CHEST)
		species_allowed = list("Tajara")

	taj_bellyfull
		name = "Belly Fur Wide (Taj)"
		icon_state = "taj_bellyfull"
		body_parts = list(BP_CHEST)
		species_allowed = list("Tajara")

	taj_nose
		name = "Nose Color (Taj)"
		icon_state = "taj_nose"
		body_parts = list(BP_HEAD)
		species_allowed = list("Tajara")

	taj_crest
		name = "Chest Fur Crest (Taj)"
		icon_state = "taj_crest"
		body_parts = list(BP_CHEST)
		species_allowed = list("Tajara")

	taj_muzzle
		name = "Muzzle Color (Taj)"
		icon_state = "taj_muzzle"
		body_parts = list(BP_HEAD)
		species_allowed = list("Tajara")

	taj_face
		name = "Cheeks Color (Taj)"
		icon_state = "taj_face"
		body_parts = list(BP_HEAD)
		species_allowed = list("Tajara")

	taj_all
		name = "All Taj Head (Taj)"
		icon_state = "taj_all"
		body_parts = list(BP_HEAD)
		species_allowed = list("Tajara")

	shaggy_mane
		name = "Shaggy mane"
		icon_state = "shaggy"
		body_parts = list(BP_CHEST)
		species_allowed = list("Tajara")

	saber_teeth
		name = "Saber teeth"
		icon_state = "saber"
		body_parts = list(BP_HEAD)
		species_allowed = list("Tajara")

	fangs
		name = "Fangs"
		icon_state = "fangs"
		body_parts = list(BP_HEAD)
		species_allowed = list("Tajara")

	tiger_stripes
		name = "Tiger Stripes"
		icon_state = "tiger"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_CHEST,BP_GROIN)
		species_allowed = list("Tajara") //There's a tattoo for non-cats

	tigerface
		name = "Tiger Stripes (Head, Major)"
		icon_state = "tigerface"
		body_parts = list(BP_HEAD)
		species_allowed = list("Tajara") //There's a tattoo for non-cats

	taj_paw_socks
		name = "Socks Coloration (Taj)"
		icon_state = "taj_pawsocks"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)
		species_allowed = list("Tajara")

	taj_paw_socks_arms
		name = "Socks Coloration (Taj, arms)"
		icon_state = "taj_pawsocks"
		body_parts = list(BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)
		species_allowed = list("Tajara")

	taj_paw_socks_legs
		name = "Socks Coloration (Taj, legs)"
		icon_state = "taj_pawsocks"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG)
		species_allowed = list("Tajara")

	//Una specific stuff
	una_face
		name = "Face Color (Unathi)"
		icon_state = "una_face"
		body_parts = list(BP_HEAD)
		species_allowed = list("Unathi")

	una_facelow
		name = "Face Color Low (Unathi)"
		icon_state = "una_facelow"
		body_parts = list(BP_HEAD)
		species_allowed = list("Unathi")

	una_scutes
		name = "Scutes (Unathi)"
		icon_state = "una_scutes"
		body_parts = list(BP_CHEST)
		species_allowed = list("Unathi")

	backstripe
		name = "Back Stripe (Unathi)"
		icon_state = "backstripe"
		body_parts = list(BP_CHEST)
		species_allowed = list("Unathi")

	una_paw_socks
		name = "Socks Coloration (Una)"
		icon_state = "una_pawsocks"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)
		species_allowed = list("Unathi")

	una_paw_socks_arms
		name = "Socks Coloration (Una)"
		icon_state = "una_pawsocks"
		body_parts = list(BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)
		species_allowed = list("Unathi")

	una_paw_socks_legs
		name = "Socks Coloration (Una)"
		icon_state = "una_pawsocks"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG)
		species_allowed = list("Unathi")

	// Snowflakey stuff
	doubleeye
		name = "Double eyes"
		icon_state = "doubleeye"
		body_parts = list(BP_HEAD)
		ckey_allowed = list("jglitch")
