/datum/map/dreyfus

	base_floor_type = /turf/simulated/floor/airless
	base_floor_area = /area/maintenance/exterior

	post_round_safe_areas = list (
		/area/centcom,
		/area/shuttle/escape/centcom,
		/area/shuttle/escape_pod1/centcom,
		/area/dreyfus/exterieur,
	)

/area/shuttle/arrival
	name = "\improper Lanzadera de llegada"

/area/shuttle/arrival/station
	icon_state = "shuttle"

//Coupole

/area/dreyfus/coupole/corridor
	name = "Cupula - Pasillo"
	icon_state = "hallC1"

/area/dreyfus/coupole/maintenance/
	name = "Cupula - Mantenimiento"
	icon_state = "maintcentral"
	flags = AREA_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = /decl/turf_initializer/maintenance

/area/dreyfus/coupole/chapelle
	name = "Capilla"
	icon_state = "chapel"

/area/dreyfus/coupole/aumonier
	name = "Oficina del capellan"
	icon_state = "chapeloffice"

/area/dreyfus/coupole/jardin
	name = "Jardín"
	icon_state = "garden"

/area/dreyfus/coupole/conference
	name = "Sala de conferencias"
	icon_state = "observatory"

/area/dreyfus/coupole/solaire/avant/exterieur
	name = "Paneles solares"
	icon_state = "panelsA"
	flags = AREA_EXTERNAL
	requires_power = 1
	always_unpowered = 1
	has_gravity = FALSE
	base_turf = /turf/space

/area/dreyfus/coupole/solaire/avant/control
	name = "Control de paneles solares"
	icon_state = "SolarcontrolA"

/area/dreyfus/coupole/solaire/arriere/exterieur
	name = "Paneles solares traseros"
	icon_state = "panelsA"
	flags = AREA_EXTERNAL
	requires_power = 1
	always_unpowered = 1
	has_gravity = FALSE
	base_turf = /turf/space

/area/dreyfus/coupole/solaire/arriere/control
	name = "Control de paneles solares traseros"
	icon_state = "SolarcontrolA"

//Pont administratif

/area/dreyfus/administration/corridor
	name = "Administracion - Pasillo"
	icon_state = "hallC1"

/area/dreyfus/administration/maintenance
	icon_state = "fmaint"
	flags = AREA_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = /decl/turf_initializer/maintenance

/area/dreyfus/administration/maintenance/avant
	name = "Administracion - Mantenimiento posterior"
	icon_state = "fmaint"

/area/dreyfus/administration/maintenance/arriere
	name = "Administracion - Mantenimiento anterior"
	icon_state = "amaint"

/area/dreyfus/administration/toilettes
	name = "Baños de la administracion"
	icon_state = "toilet"

/area/dreyfus/administration/sec/reception
	name = "Recepcion de seguridad"
	icon_state = "security"

/area/dreyfus/administration/sec/vestiaires
	name = "Taquillas de seguridad"
	icon_state = "brig"

/area/dreyfus/administration/sec/cellule
	name = "Celda de detencion"
	icon_state = "sec_prison"

/area/dreyfus/administration/sec/armurerie
	name = "Armería"
	icon_state = "armory"

/area/dreyfus/administration/sec/marshall
	name = "Oficina del marshall"
	icon_state = "sec_hos"

/area/dreyfus/administration/bureaux/openspace
	name = "Oficina administrativa"
	icon_state = "library"

/area/dreyfus/administration/bureaux/executif
	name = "Oficinas ejecutivas"
	icon_state = "law"

/area/dreyfus/administration/bureaux/directeur
	name = "Cuarto del director"
	icon_state = "captain"


//Pont residentiel

/area/dreyfus/residentiel/dock/corridor
	name = "Amarre de salida"
	icon_state = "hallC1"
	sound_env = HALLWAY

/area/dreyfus/residentiel/dock/toilettes
	name = "Baños residenciales"
	icon_state = "toilet"
	sound_env = BATHROOM

/area/dreyfus/residentiel/hub/corridor
	name = "Corredor central residencial"
	icon_state = "hallC2"
	sound_env = HALLWAY

/area/dreyfus/residentiel/hub/concierge
	name = "Conserjería"
	icon_state = "janitor"
	sound_env = SMALL_ENCLOSED

/area/dreyfus/residentiel/sejour/Corridor
	name = "Residencial - Pasillo"
	icon_state = "hallC3"
	sound_env = HALLWAY

/area/dreyfus/residentiel/sejour/cryo
	name = "Sala de criogénicas"
	icon_state = "cryo"
	sound_env = SMALL_SOFTFLOOR

/area/dreyfus/residentiel/sejour/gym
	name = "Gimnasio"
	icon_state = "fitness"
	sound_env = MEDIUM_SOFTFLOOR

/area/dreyfus/residentiel/sejour/cafet
	name = "Cafetería"
	icon_state = "cafeteria"
	sound_env = STANDARD_STATION

/area/dreyfus/residentiel/sejour/cuisine
	name = "Cocina"
	icon_state = "kitchen"
	sound_env = MEDIUM_SOFTFLOOR

/area/dreyfus/residentiel/sejour/vestiaire
	name = "Taquillas"
	icon_state = "crew_quarters"
	sound_env = MEDIUM_SOFTFLOOR

/area/dreyfus/residentiel/quartiers/corridor
	name = "Pasillo a dormitorios"
	icon_state = "hallf"
	sound_env = TUNNEL_ENCLOSED

/area/dreyfus/residentiel/quartiers/chambre1
	name = "Camara 1"
	icon_state = "crew_quarters"
	sound_env = SMALL_SOFTFLOOR

/area/dreyfus/residentiel/quartiers/chambre2
	name = "Camara 2"
	icon_state = "crew_quarters"
	sound_env = SMALL_SOFTFLOOR

/area/dreyfus/residentiel/quartiers/chambre3
	name = "Camara 3"
	icon_state = "crew_quarters"
	sound_env = SMALL_SOFTFLOOR

/area/dreyfus/residentiel/clinique/reception
	name = "Recepcion de la clínica"
	icon_state = "medbay3"
	sound_env = SMALL_SOFTFLOOR

/area/dreyfus/residentiel/clinique/urgences
	name = "Acceso a urgencias"
	icon_state = "medbay4"
	sound_env = STANDARD_STATION

/area/dreyfus/residentiel/clinique/traitement
	name = "Sala de tratamientos"
	icon_state = "medbay"
	sound_env = MEDIUM_SOFTFLOOR

/area/dreyfus/residentiel/clinique/laboratoire
	name = "Laboratorio medicinal"
	icon_state = "medbay2"
	sound_env = STANDARD_STATION

/area/dreyfus/residentiel/clinique/chirurgie
	name = "Sala de operaciones"
	icon_state = "medbay2"
	sound_env = STANDARD_STATION

/area/dreyfus/residentiel/clinique/patients
	name = "Salas de pacientes"
	icon_state = "patients"
	sound_env = MEDIUM_SOFTFLOOR

/area/dreyfus/residentiel/clinique/vestiaire
	name = "Taquillas de la clínica"
	icon_state = "medbay"
	sound_env = STANDARD_STATION

/area/dreyfus/residentiel/clinique/repos
	name = "Sala de asistencia médica"
	icon_state = "medbay2"
	sound_env = MEDIUM_SOFTFLOOR

/area/dreyfus/residentiel/clinique/morgue
	name = "Morgue"
	icon_state = "morgue"
	sound_env = SMALL_ENCLOSED

/area/dreyfus/residentiel/maintenance
	icon_state = "fmaint"
	flags = AREA_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = /decl/turf_initializer/maintenance


/area/dreyfus/residentiel/maintenance/avant
	name = "Residencial - Mantenimiento posterior"
	icon_state = "fmaint"

/area/dreyfus/residentiel/maintenance/arriere
	name = "Residencial - Mantenimiento anterior"
	icon_state = "amaint"


//Pont cargo

/area/dreyfus/cargo/maintenance/babord
	name = "Industrial - Mantenimiento babor"
	icon_state = "maint_cargo"

/area/dreyfus/cargo/maintenance/tribord
	name = "Industrial - Mantenimiento estribor"
	icon_state = "maint_cargo"

/area/dreyfus/cargo/industrie/accueil
	name = "Oficina de entregas y pedidos"
	icon_state = "conference"

/area/dreyfus/cargo/industrie/entrepot
	name = "Almacén principal"
	icon_state = "primarystorage"

/area/dreyfus/cargo/industrie/entrepot/specialise
	name = "Almacén auxiliar"
	icon_state = "auxstorage"

/area/dreyfus/cargo/industrie/production
	name = "Taller de produccion"
	icon_state = "mining_production"

/area/dreyfus/cargo/industrie/raffinerie
	name = "Refinería"
	icon_state = "mining"

/area/dreyfus/cargo/industrie/bureau_qm
	name = "Oficina del capataz"
	icon_state = "quartoffice"

/area/dreyfus/cargo/industrie/quartiers
	name = "Industrial - Taquillas"
	icon_state = "crew_quarters"

/area/dreyfus/cargo/Corridor
	name = "Industrial - Pasillo"
	icon_state = "hallC1"

/area/dreyfus/cargo/recherche/robotique
	name = "Taller de robotica"
	icon_state = "robotics"

/area/dreyfus/cargo/recherche/developpement
	name = "Laboratorio de investigacion y desarrollo"
	icon_state = "research"

/area/dreyfus/cargo/recherche/salon
	name = "Sala de investigacion"
	icon_state = "research"

/area/dreyfus/cargo/recherche/bureau_rd
	name = "Oficina del supervisor"
	icon_state = "quartoffice"

/area/dreyfus/cargo/recherche/labo_xenoarch
	name = "Laboratorio de xenoarqueología"
	icon_state = "xeno_lab"

/area/dreyfus/cargo/recherche/labo_anomalies
	name = "Laboratorio de anomalías"
	icon_state = "anomaly"

/area/dreyfus/cargo/maintenance
	icon_state = "fmaint"
	flags = AREA_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = /decl/turf_initializer/maintenance


//Pont ingenierie

/area/dreyfus/ingenierie/moteur/atmos
	name = "Soporte vital"
	icon_state = "atmos"

/area/dreyfus/ingenierie/moteur
	name = "Generador"
	icon_state = "engine"

/area/dreyfus/ingenierie/moteur/SMES
	name = "Almacenamiento energético"
	icon_state = "engine_smes"

/area/dreyfus/ingenierie/moteur/controle
	name = "Sala de control del generador"
	icon_state = "engine_monitoring"

/area/dreyfus/ingenierie/moteur/acces
	name = "Acceso al generador"
	icon_state = "maint_engine"

/area/dreyfus/ingenierie/maintenance
	name = "Ingeniería - Mantenimiento"
	icon_state = "maint_engineering"
	flags = AREA_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = /decl/turf_initializer/maintenance

/area/dreyfus/ingenierie/acces
	name = "Acceso a ingeniería"
	icon_state = "engineering_foyer"

/area/dreyfus/ingenierie/controle
	name = "Sala de control de ingeniería"
	icon_state = "engine_monitoring"

/area/dreyfus/ingenierie/equipement
	name = "Ingeniería - Taquilla"
	icon_state = "engineering_locker"

/area/dreyfus/ingenierie/EVA
	name = "AEV (EVA)"
	icon_state = "eva"

/area/dreyfus/ingenierie/quartiers
	name = "Dormitorios de ingeniería"
	icon_state = "crew_quarters"

/area/dreyfus/ingenierie/telecomm
	name = "Telecomunicaciones"
	icon_state = "tcomsatcham"

/area/dreyfus/ingenierie/detente
	name = "Ingeniería - Sala de descanso"
	icon_state = "engineering_break"

// Falso puente (Faux pont) - Pero lo vamos a llamar "Sotano"

/area/dreyfus/fauxpont/maintenance
	name = "Sotano - Mantenimiento de Sintéticos"
	icon_state = "maint_eva"
	flags = AREA_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = /decl/turf_initializer/maintenance


/area/dreyfus/fauxpont/decheterie
	name = "Sotano - Tratamiento de residuos"
	icon_state = "disposal"

/area/dreyfus/fauxpont/drones
	name = "Sotano - Taller auxiliar"
	icon_state = "ai_cyborg"

/area/dreyfus/fauxpont/iasalon // <---
	name = "Sotano - Acceso a IA"
	icon_state = "ai_foyer"

/area/dreyfus/fauxpont/iacontrole
	name = "Sotano - Sala de control IA"
	icon_state = "ai_upload"

/area/dreyfus/fauxpont/iachambre
	name = "Sotano - Camara de la IA"
	icon_state = "ai_chamber"

// ESTO ESTa REPETIDO!!! // THIS APPEARS TWICE!! - Sansaur

/area/dreyfus/fauxpont/iasalon // <---
	name = "Acceso a IA"
	icon_state = "ai_foyer"

/area/dreyfus/fauxpont/vestiaires //????
	name = "Vestuario auxiliar"
	icon_state = "engineering"

// Areas del ascensor
/area/turbolift/coupole
	name = "Ascensor (Cupula)"
	lift_floor_label = "Sector A"
	lift_floor_name = "Cupula"
	lift_announce_str = "Bienvenidos al sector A, Cupula : Sala de conferencias, Capilla y Jardin."

/area/turbolift/bureaux
	name = "Ascensor (Oficinas)"
	lift_floor_label = "Sector B"
	lift_floor_name = "Administracion"
	lift_announce_str = "Bienvenidos al sector B, Administracion : Oficinas de empleados, de Director, de Marshall y Evacuacion."

/area/turbolift/civil
	name = "Ascensor (Residencial)"
	lift_floor_label = "Sector C"
	lift_floor_name = "Zona Residencial"
	lift_announce_str = "Bienvenidos al sector C, Zona Residencial : Cafetería, Gimnasio, Taquillas, Clínica y Dormitorios."

/area/turbolift/cargo
	name = "Ascensor (Fabrica)"
	lift_floor_label = "Sector D"
	lift_floor_name = "Zona Industrial"
	lift_announce_str = "Bienvenidos al sector D, Zona Industral : Fabrica, Almacenes, Refinaría e Investigacion y Desarrollo."

/area/turbolift/engi
	name = "Ascensor (Ingeniería)"
	lift_floor_label = "Sector E"
	lift_floor_name = "Ingeniería"
	lift_announce_str = "Bienvenidos al sector E, Ingeniería : Generador, Soporte Vital y Telecomunicaciones."
	base_turf = /turf/simulated/floor

// Dircen

/area/syndicate_mothership
	name = "Base Mercenaria"
	icon_state = "syndie-ship"
	requires_power = 0
	dynamic_lighting = 0

area/shuttle/lavalette/
	name = "Corbeta La Veleta"

/area/shuttle/lavalette/start
	icon_state = "shuttlered"

/area/shuttle/lavalette/transit
	icon_state = "shuttlered"

/area/shuttle/lavalette/coupole
	icon_state = "shuttlered"

/area/shuttle/lavalette/xeno
	icon_state = "shuttlered"

/area/shuttle/lavalette/residentiel
	icon_state = "shuttlered"

/area/shuttle/lavalette/transit
	icon_state = "shuttle"
	base_turf = /turf/unsimulated/floor/bluespace

/area/shuttle/escape/transit
	icon_state = "shuttle"
	base_turf = /turf/space/transit/east

/area/shuttle/escape/station
	icon_state = "shuttle"

area/shuttle/merc/
	name = "Cazador Huon"

/area/shuttle/merc/start
	icon_state = "shuttlered"

/area/shuttle/merc/transit
	icon_state = "shuttle"
	base_turf = /turf/unsimulated/floor/bluespace

/area/shuttle/merc/station
	icon_state = "shuttlered"

/area/shuttle/merc/coupole
	icon_state = "shuttlered"

/area/shuttle/merc/minage
	icon_state = "shuttlered"

/area/shuttle/merc/residentiel
	icon_state = "shuttlered"

/area/shuttle/escape_pod1
	name = "\improper Capusla de escape nº1"
	flags = AREA_RAD_SHIELDED

/area/shuttle/escape_pod1/station
	icon_state = "shuttle2"

/area/shuttle/escape_pod1/transit
	icon_state = "shuttle"
	base_turf = /turf/space/transit/east

/area/dreyfus/exterieur
	icon_state = "mining"
	requires_power = 0
	dynamic_lighting = 0