//Helpers for the pods
//If you want to make a new one
//Just copy paste the pod 1 code and change 1 for 2 and so on

/datum/shuttle/autodock/ferry/escape_pod
	category = /datum/shuttle/autodock/ferry/escape_pod
	sound_takeoff = 'sound/effects/rocket.ogg'
	sound_landing = 'sound/effects/rocket_backwards.ogg'
	var/number

/datum/shuttle/autodock/ferry/escape_pod/New()
	name = "Escape Pod [number]"
	dock_target = "escape_pod_[number]"
	arming_controller = "escape_pod_[number]_berth"
	waypoint_station = "escape_pod_[number]_start"
	landmark_transition = "escape_pod_[number]_internim"
	waypoint_offsite = "escape_pod_[number]_out"
	..()

/obj/effect/shuttle_landmark/escape_pod/
	var/number

/obj/effect/shuttle_landmark/escape_pod/start
	name = "Docked"

/obj/effect/shuttle_landmark/escape_pod/start/New()
	landmark_tag = "escape_pod_[number]_start"
	docking_controller = "escape_pod_[number]_berth"
	..()

/obj/effect/shuttle_landmark/escape_pod/transit
	name = "In transit"

/obj/effect/shuttle_landmark/escape_pod/transit/New()
	landmark_tag = "escape_pod_[number]_internim"
	..()

/obj/effect/shuttle_landmark/escape_pod/out
	name = "Escaped"

/obj/effect/shuttle_landmark/escape_pod/out/New()
	landmark_tag = "escape_pod_[number]_out"
	..()

//Actually pods

/datum/shuttle/autodock/ferry/escape_pod/escape_pod1
	shuttle_area = /area/shuttle/escape_pod1/station
	number = 1
/obj/effect/shuttle_landmark/escape_pod/start/pod1
	number = 1
/obj/effect/shuttle_landmark/escape_pod/out/pod1
	number = 1
/obj/effect/shuttle_landmark/escape_pod/transit/pod1
	number = 1

//Rescue shuttle

/datum/shuttle/autodock/multi/antag/rescue
	name = "Rescue"
	warmup_time = 0
	destinations = list(
		"nav_lavalette_coupole",
		"nav_lavalette_xenoarch",
		"nav_lavalette_residen",
		"nav_lavalette_start",
		)
	shuttle_area = /area/shuttle/lavalette/start
	current_location = "nav_lavalette_start"
	landmark_transition = "nav_lavalette_transition"
	home_waypoint = "nav_lavalette_start"
	announcer = "CRV La Valette"
	arrival_message = "Attention, there's a small patrol craft headed your way, it flashed us Asset Protection codes and we let it pass. You've got guests on the way."
	departure_message = "That Asset Protection vessel is headed back the way it came. Hope they were helpful."

/obj/effect/shuttle_landmark/lavalette/start
	name = "Espace de Patrouille"
	landmark_tag = "nav_lavalette_start"

/obj/effect/shuttle_landmark/lavalette/internim
	name = "In transit"
	landmark_tag = "nav_lavalette_transition"

/obj/effect/shuttle_landmark/lavalette/xenoarch
	name = "Au sas de Xenoarcheologie"
	landmark_tag = "nav_lavalette_xenoarch"

/obj/effect/shuttle_landmark/lavalette/coupole
	name =  "Proche de la Coupole"
	landmark_tag = "nav_lavalette_coupole"

/obj/effect/shuttle_landmark/lavalette/residentiel
	name = "Pres de l'acces Residentiel"
	landmark_tag = "nav_lavalette_residen"

//Cargo shuttle

/datum/shuttle/autodock/ferry/supply/drone
	name = "Supply"
	location = 1
	warmup_time = 10
	shuttle_area = /area/supply/dock
	dock_target = "supply_shuttle"
	waypoint_offsite = "nav_cargo_start"
	waypoint_station = "nav_cargo_station"

/obj/effect/shuttle_landmark/supply/centcom
	name = "Centcom"
	landmark_tag = "nav_cargo_start"

/obj/effect/shuttle_landmark/supply/station
	name = "Dock Station"
	landmark_tag = "nav_cargo_station"
	docking_controller = "cargo_bay"

//Emergency shuttle

/datum/shuttle/autodock/ferry/emergency/centcom
	name = "Escape"
	location = 1
	warmup_time = 10
	shuttle_area = /area/shuttle/escape/centcom
	dock_target = "escape_shuttle"
	landmark_transition = "nav_escape_transition"
	waypoint_offsite = "nav_centcom_dock"
	waypoint_station = "nav_escape_dock"

/obj/effect/shuttle_landmark/escape/centcom
	name = "Centcom"
	landmark_tag = "nav_centcom_dock"
	docking_controller = "centcom_dock"

/obj/effect/shuttle_landmark/escape/internim
	name = "In transit"
	landmark_tag = "nav_escape_transition"

/obj/effect/shuttle_landmark/escape/station
	name = "Station"
	landmark_tag = "nav_escape_dock"
	docking_controller = "escape_dock"

//Merc

/datum/shuttle/autodock/multi/antag/mercenary
	name = "Mercenary"
	warmup_time = 0
	destinations = list(
		"nav_merc_start",
		"nav_merc_dock",
		"nav_merc_coupole",
		"nav_merc_minage",
		"nav_merc_residentiel",
		)
	shuttle_area = /area/shuttle/merc/start
	dock_target = "ship_merc"
	current_location = "nav_merc_start"
	landmark_transition = "nav_merc_transition"
	announcer = "Chasseur Huon"
	home_waypoint = "nav_merc_start"
	arrival_message = "Attention, you have a large signature approaching the station - looks unarmed to surface scans. We're too far out to intercept - brace for visitors."
	departure_message = "Your visitors are on their way out of the system, burning delta-v like it's nothing. Good riddance."

/obj/effect/shuttle_landmark/merc/start
	name = "Base Mercenaire"
	landmark_tag = "nav_merc_start"
	docking_controller = "dock_merc"

/obj/effect/shuttle_landmark/merc/internim
	name = "In transit"
	landmark_tag = "nav_merc_transition"

/obj/effect/shuttle_landmark/merc/dock
	name = "Docking Port"
	landmark_tag = "nav_merc_dock"
	docking_controller = "dock2"

/obj/effect/shuttle_landmark/merc/coupole
	name = "Proche de la Coupole"
	landmark_tag = "nav_merc_coupole"

/obj/effect/shuttle_landmark/merc/minage
	name = "Au sas de Minage"
	landmark_tag = "nav_merc_minage"

/obj/effect/shuttle_landmark/merc/residentiel
	name = "Pres de l'acces Residentiel"
	landmark_tag = "nav_merc_residentiel"
