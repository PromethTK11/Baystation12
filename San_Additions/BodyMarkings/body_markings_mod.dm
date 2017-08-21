/*
	Let's try to put as much as possible as a mod file
*/

// Initialization

var/global/list/body_marking_styles_list = list()		//stores /datum/sprite_accessory/marking indexed by name

/hook/global_init/makeDatumRefLists()
	..()
	var/list/paths = list()
	//Body markings - Initialise all /datum/sprite_accessory/marking into an list indexed by marking name
	paths = typesof(/datum/sprite_accessory/marking) - /datum/sprite_accessory/marking
	for(var/path in paths)
		var/datum/sprite_accessory/marking/M = new path()
		body_marking_styles_list[M.name] = M

	return 1

// DNA

/datum/dna
	var/list/body_markings = list()

/datum/dna/ResetUIFrom(var/mob/living/carbon/human/character)
	..()
	body_markings.Cut()
	for(var/obj/item/organ/external/E in character.organs)
		if(E.markings.len)
			body_markings[E.organ_tag] = E.markings.Copy()
	UpdateUI()

/mob/UpdateAppearance(var/list/UI=null)
	if(..())
		//Body markings
		var/mob/living/carbon/human/H = src
		for(var/tag in dna.body_markings)
			var/obj/item/organ/external/E = H.organs_by_name[tag]
			if(E)
				var/list/marklist = dna.body_markings[tag]
				E.markings = marklist.Copy()

		H.force_update_limbs()
		H.update_body()
		H.update_eyes()
		H.update_hair()

		return 1
	else
		return 0

datum/preferences
	var/list/body_markings = list() // "name" = "#rgbcolor"

/obj/item/organ/external
	var/list/markings = list()         // Markings (body_markings) to apply to the icon


/obj/item/organ/external/head/get_icon()
	..()
	//Body markings, does not include head, duplicated (sadly) above.
	for(var/M in markings)
		var/datum/sprite_accessory/marking/mark_style = markings[M]["datum"]
		var/icon/mark_s = new/icon("icon" = mark_style.icon, "icon_state" = "[mark_style.icon_state]-[organ_tag]")
		mark_s.Blend(markings[M]["color"], ICON_ADD)
		overlays |= mark_s //So when it's not on your body, it has icons
		mob_icon.Blend(mark_s, ICON_OVERLAY) //So when it's on your body, it has icons
		icon_cache_key += "[M][markings[M]["color"]]"
	return mob_icon

/obj/item/organ/external/get_icon()
	..()
	update_icon()
	//Head markings, duplicated (sadly) below.
	for(var/M in markings)
		var/datum/sprite_accessory/marking/mark_style = markings[M]["datum"]
		var/icon/mark_s = new/icon("icon" = mark_style.icon, "icon_state" = "[mark_style.icon_state]-[organ_tag]")
		mark_s.Blend(markings[M]["color"], ICON_ADD)
		overlays |= mark_s //So when it's not on your body, it has icons
		mob_icon.Blend(mark_s, ICON_OVERLAY) //So when it's on your body, it has icons
		icon_cache_key += "[M][markings[M]["color"]]"
	return mob_icon

/obj/item/organ/external/update_icon(var/regenerate = 0)
	..()
	//Body markings, does not include head, duplicated (sadly) above.
	for(var/M in markings)
		var/datum/sprite_accessory/marking/mark_style = markings[M]["datum"]
		var/icon/mark_s = new/icon("icon" = mark_style.icon, "icon_state" = "[mark_style.icon_state]-[organ_tag]")
		mark_s.Blend(markings[M]["color"], ICON_ADD)
		overlays |= mark_s //So when it's not on your body, it has icons
		mob_icon.Blend(mark_s, ICON_OVERLAY) //So when it's on your body, it has icons
		icon_cache_key += "[M][markings[M]["color"]]"