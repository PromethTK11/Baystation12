datum/shuttle/multi_shuttle/rescue
	name = "Rescue"
	warmup_time = 0
	origin = /area/shuttle/lavalette/start
	interim = /area/shuttle/lavalette/transit
	start_location = "Espacio de Patrulla" /////////???????????????? -Sansaur
	destinations = list(
		"Aproximarse a la cupula" = /area/shuttle/lavalette/coupole,
		"Exclusa de xenoarqueología" = /area/shuttle/lavalette/xeno,
		"Acceso a residencial" = /area/shuttle/lavalette/residentiel,
		)
	announcer = "CRV La Veleta"

/datum/shuttle/multi_shuttle/rescue/New()
	arrival_message = "Attention, [using_map.station_short], there's a small patrol craft headed your way, it flashed us Asset Protection codes and we let it pass. You've got guests on the way."
	departure_message = "[using_map.station_short], That Asset Protection vessel is headed back the way it came. Hope they were helpful."
	..()

/datum/shuttle/ferry/supply/cargo
	name = "Supply"
	location = 1
	warmup_time = 5
	area_offsite = /area/supply/dock
	area_station = /area/supply/station
	docking_controller_tag = "supply_shuttle"
	dock_target_station = "cargo_bay"

/datum/shuttle/ferry/emergency/centcom
	name = "Escape"
	location = 1
	warmup_time = 10
	area_offsite = /area/shuttle/escape/centcom
	area_station = /area/shuttle/escape/station
	area_transition = /area/shuttle/escape/transit
	docking_controller_tag = "escape_shuttle"
	dock_target_station = "escape_dock"
	dock_target_offsite = "centcom_dock"
	transit_direction = EAST

/datum/shuttle/multi_shuttle/mercenary
	name = "Mercenary"
	warmup_time = 0
	origin = /area/shuttle/merc/start
	interim = /area/shuttle/merc/transit
	start_location = "Base Mercenaria"
	destinations = list(
		"Puerto de la estacion" = /area/shuttle/merc/station,
		"Aproximarse a la cupula" = /area/shuttle/merc/coupole,
		"Esclusa de minería" = /area/shuttle/merc/minage,
		"Acceso residencial" = /area/shuttle/merc/residentiel,
		)
	docking_controller_tag = "ship_merc"
	destination_dock_targets = list(
		"Base mercenaria" = "dock_merc",
		"Puerto de la estacion" = "dock1",
		)
	announcer = "Cazador Huon"

/datum/shuttle/multi_shuttle/mercenary/New()
	arrival_message = "Atencion, [using_map.station_short], hemos detectado una señal de una nave aproximandose a la estacion, los escaneos revelan que va desarmada, preparaos para recibir visita."
	departure_message = "Vuestros visitantes se marchan del sistema, [using_map.station_short], estan quemando combustible del caro como si no fuera nada, hasta nunca, visitantes."
	..()

/datum/shuttle/ferry/escape_pod/escape_pod_one
	name = "Capusla de escape nº1"
	location = 0
	warmup_time = 0
	area_station = /area/shuttle/escape_pod1/station
	area_offsite = /area/shuttle/escape_pod1/centcom
	area_transition = /area/shuttle/escape_pod1/transit
	docking_controller_tag = "evacpod1"
	dock_target_station = "evacpod1_sas"
	transit_direction = EAST