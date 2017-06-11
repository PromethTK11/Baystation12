
/datum/map/dreyfus
	name = "Dreyfus"
	full_name = "ESIN Dreyfus"
	path = "dreyfus"
	flags = MAP_HAS_BRANCH

	lobby_icon = 'maps/dreyfus/icons/lobby.dmi'

	station_levels = list(1,2,3,4,5,6)
	admin_levels = list(8)
	contact_levels = list(1,2,3,4,5,6)
	player_levels = list(1,2,3,4,5,6,7)
	accessible_z_levels = list("1"=1,"2"=1,"3"=1,"4"=1,"5"=1,"6"=1,"7"=90)

	allowed_spawns = list("Arrivals Shuttle", "Cryogenic Storage")
	default_spawn = "Arrivals Shuttle"

	station_name  = "ESIN Dreyfus"
	station_short = "Dreyfus"
	dock_name     = "Rele NTTM1-54" // sur Charnay-4
	boss_name     = "Direccion central"
	boss_short    = "CENTDIR"
	company_name  = "Industrias NanoTrasen"
	company_short = "NTi"
	system_name = "Iota-Pavonis"

	id_hud_icons = 'maps/dreyfus/icons/assignment_hud.dmi'


	map_admin_faxes = list("Buzon de entrada de Industrias NanoTrasen")

	shuttle_docked_message = "La lanzadera ha llegado al puerto %Dock_name% y se encuentra amarrada a la estacion. Salida programada en: %ETD%"
	shuttle_leaving_dock = "La lanzadera ha despegado. Llegada estimada en: %ETA%."
	shuttle_called_message = "La lanzadera ha sido llamada y se aproxima al puerto %Dock_name% . Llegara aproximadamente en: %ETA%"
	shuttle_recall_message = "Se ha anulado la llegada de la lanzadera."
	emergency_shuttle_docked_message = "La lanzadera de evacuacion se ha amarrado a la estacion. Tiempo restante para la evacuacion: %ETD%."
	emergency_shuttle_leaving_dock = "La lanzadera de evacuacion ha abandonado la estacion. Llegada aproximada a: %ETA%."
	emergency_shuttle_called_message = "Se ha llamado a la lanzadera de evacuacion. Llegada aproximada en: %ETA%"
	emergency_shuttle_recall_message = "La llegada de la lanzadera de evacuacion ha sido cancelada. El coste de las maniobras de regreso sera deducido directamente de vuestros salarios."

	evac_controller_type = /datum/evacuation_controller/shuttle

/datum/map/dreyfus/perform_map_generation()
	new /datum/random_map/automata/cave_system(null,1,1,3,255, 255) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null,1,1,3,64, 64)
	new /datum/random_map/automata/cave_system(null,1,1,4,255, 255) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null,1,1,4,64, 64)
	new /datum/random_map/automata/cave_system(null,1,1,2,255, 255) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null,1,1,2,64, 64)
	return 1
