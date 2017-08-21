/*
	This can be added to any species
	but it is meant to be used for Tajara and Vulpkanin

	These 2 procs increase body temperature based on clothing UP TO (species.heat_level_1 - 5)

*/

/datum/species/proc/handle_clothing_heat(var/mob/living/carbon/human/H)
	// We don't check for clothing heat if there's no air in our current tile because space.
	// What if the station is cold? This is meant for species with fur or with layers of cold protection. If the station is cold, get naked and you'll be fine
	// If the station is hot, you'll get heat anyways
	var/turf/simulated/T
	if(isturf(H.loc))
		T = H.loc
		if(!T.air)
			return
	// Clothes that can give heat are: Unders, Suits, Gloves, Gas Masks and Helmets (Not hats)
	// There will be some clothing that don't give heat at all, like shorts or the tux vest
	var/list/clothing_gives_no_heat = list(
										/obj/item/clothing/suit/stripper,
										/obj/item/clothing/suit/poncho,
										)
	// Also, some clothing that doesn't give too much heat but should... like the Hastur, for example
	// Recommended to go 6 for "single part heat" and lower for just "additive heat"
	var/list/clothing_additional_heat = list(
										/obj/item/clothing/suit/hastur = 5,
										/obj/item/clothing/suit/rubber = 5,
										/obj/item/clothing/suit/radiation = 5,
										/obj/item/clothing/suit/chickensuit = 5,
										/obj/item/clothing/suit/bomb_suit = 5,
										/obj/item/clothing/suit/bio_suit = 5,
										/obj/item/clothing/suit/imperium_monk = 5,
										/obj/item/clothing/suit/monkeysuit = 5,
										/obj/item/clothing/suit/space = 5
										)
	// The clothing that actually GIVES heat will give it based off it's armor stats and w_class
	// We will check one by one since unders and suits should give more heat than other heat sources
	var/adding_heat = 0
	var/quadruple_uniform_heat = 1
	// Uniforms
	var/obj/item/clothing/Checking = H.w_uniform
	if(Checking && !is_type_in_list(Checking, clothing_gives_no_heat) && (Checking.body_parts_covered & UPPER_TORSO) && (Checking.body_parts_covered & LOWER_TORSO))	// Can only get heat from unders if they cover the chest and groin
		adding_heat += get_clothing_heat(Checking)
		quadruple_uniform_heat = 4
		if(is_type_in_list(Checking, clothing_additional_heat))
			adding_heat += clothing_additional_heat[Checking.type]

	// Suits
	Checking = H.wear_suit
	if(Checking && !is_type_in_list(Checking, clothing_gives_no_heat))
		adding_heat += get_clothing_heat(Checking)
		if(is_type_in_list(Checking, clothing_additional_heat))
			adding_heat += clothing_additional_heat[Checking.type]
		// If we're wearing a uniform under the suit and the uniform covers the chest, the heat is quadrupled
		adding_heat += adding_heat * quadruple_uniform_heat



	// Gloves
	Checking = H.gloves
	if(Checking && !is_type_in_list(Checking, clothing_gives_no_heat))
		adding_heat += get_clothing_heat(Checking)
		if(is_type_in_list(Checking, clothing_additional_heat))
			adding_heat += clothing_additional_heat[Checking.type]


	// Masks
	Checking = H.wear_mask
	if(Checking && !is_type_in_list(Checking, clothing_gives_no_heat))
		adding_heat += get_clothing_heat(Checking)
		if(is_type_in_list(Checking, clothing_additional_heat))
			adding_heat += clothing_additional_heat[Checking.type]


	// Helmets
	Checking = H.head
	if(Checking && !is_type_in_list(Checking, clothing_gives_no_heat))
		if(istype(Checking, /obj/item/clothing/head/helmet) || istype(Checking, /obj/item/clothing/head/bio_hood))
			adding_heat += get_clothing_heat(Checking)
		if(is_type_in_list(Checking, clothing_additional_heat))
			adding_heat += clothing_additional_heat[Checking.type]


//	if(adding_heat > 12)
//		adding_heat = 12	// A limit to how much heat you can get from clothing, I'm not checking absolutely everything, but I'm pretty sure you cannot get +12K from clothing alone
//		// Also to avoid getting burns from clothing temperature

	// YOU CANNOT START BURNING FROM CLOTHING ALONE
	var/target_temperature = H.species.body_temperature + adding_heat
	if(H.bodytemperature < target_temperature)
		if((H.bodytemperature+adding_heat) >= H.species.heat_level_1)
			H.bodytemperature = H.species.heat_level_1 - 5
		else
			H.bodytemperature += adding_heat

/proc/get_clothing_heat(var/obj/item/clothing/C)
	var/heat = C.w_class / 2
	for(var/nombre in C.armor)
		heat += C.armor[nombre] / 100

	heat = round(heat)
	return heat