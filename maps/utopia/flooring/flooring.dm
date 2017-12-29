/decl/flooring/tiling/bunker/
	name = "floor"
	desc = "Don't slip."
	icon = 'maps/utopia/flooring/bunk.dmi'
	icon_base = "plating"
	has_damage_range = null
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/bunker

/decl/flooring/tiling/bunker/hydro
	name = "floor"
	desc = "Don't slip."
	icon_base = "hydro"
	has_damage_range = null
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/floor_hydro

/decl/flooring/tiling/bunker/showroom
	name = "floor"
	desc = "Don't slip."
	icon_base = "hydro"
	has_damage_range = null
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/floor_showroom

/decl/flooring/tiling/bunker/cafe
	name = "floor"
	desc = "Don't slip."
	icon_base = "cafe"
	has_damage_range = null
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/floor_cafe

/decl/flooring/tiling/bunker/yellow
	name = "floor"
	desc = "Don't slip."
	icon_base = "old_tile_cargo"
	has_damage_range = null
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/yellow

/decl/flooring/tiling/bunker/black
	name = "floor"
	desc = "Don't slip."
	icon_base = "old_tile_black"
	has_damage_range = null
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/black

/decl/flooring/tiling/bunker/red
	name = "floor"
	desc = "Don't slip."
	icon_base = "old_tile_red"
	has_damage_range = null
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/red

/decl/flooring/tiling/bunker/polar
	name = "floor"
	desc = "Don't slip."
	icon_base = "polar"
	has_damage_range = null
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/polar

/decl/flooring/reinforced/ramp
	name = "foot ramp"
	desc = "An archaic means of locomotion along the Z axis."
	icon = 'maps/utopia/flooring/tiles.dmi'
	icon_base = "ramptop"
	build_type = null
	flags = TURF_ACID_IMMUNE | TURF_CAN_BREAK
	can_paint = 1

/decl/flooring/reinforced/ramp/bottom
	icon_base = "rampbot"
