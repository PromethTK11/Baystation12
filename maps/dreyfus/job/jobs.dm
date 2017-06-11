/datum/map/dreyfus
	allowed_jobs = list(
						/datum/job/assistant,
						/datum/job/captain,
						/datum/job/hop,
						/datum/job/employe,
						/datum/job/rd,
						/datum/job/scientist,
						/datum/job/doctor,
						/datum/job/hos,
						/datum/job/qm,
						/datum/job/engineer,
						/datum/job/cargo_tech,
						/datum/job/mining,
						/datum/job/ouvrier,
						/datum/job/chef,
						/datum/job/chaplain,
						/datum/job/janitor,
						/datum/job/ai,
						/datum/job/cyborg,
						)

/datum/job/assistant
	title = "Pasajero"
	supervisors = "todo el mundo"
	minimal_player_age = 14
	economic_modifier = 3
	ideal_character_age = 21
	alt_titles = list(
		"Accionista",
		"Periodista",
		"Visitante",
		"Aprendiz",
		"Estudiante",
		)
	allowed_branches = list(
		/datum/mil_branch/administration,
		/datum/mil_branch/contractuel,
		/datum/mil_branch/ouvrier,
	)

/datum/job/captain
	title = "Director General"
	supervisors = "NanoTrasen y los Accionistas"
	minimal_player_age = 41
	economic_modifier = 15
	ideal_character_age = 65
	alt_titles = list(
		"Director Ejecutivo",
		)
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/directeur
	allowed_branches = list(
		/datum/mil_branch/administration
	)

/datum/job/hop
	title = "Director Adjunto"
	supervisors = "El director general"
	minimal_player_age = 31
	economic_modifier = 12
	ideal_character_age = 45
	total_positions = 2
	spawn_positions = 2
	alt_titles = list(
		"Director R.H.",
		"Director de Finanzas",
		)
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/adjoint
	allowed_branches = list(
		/datum/mil_branch/administration
	)

/datum/job/employe
	title = "Empleado Administrativo"
	supervisors = "los directores"
	minimal_player_age = 21
	economic_modifier = 8
	ideal_character_age = 30
	total_positions = 5
	spawn_positions = 5
	selection_color = "#6161aa"
	faction = "Station"
	department_flag = COM
	department = "Command"
	alt_titles = list(
		"Administrador",
		"Secretario",
		"Controlador",
		)
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/employe
	allowed_branches = list(
		/datum/mil_branch/administration
	)
	announced = 1
	access = list(access_lawyer)
	minimal_access = list(access_lawyer, access_heads)

/datum/job/rd
	title = "Supervisor"
	supervisors = "el director general"
	minimal_player_age = 21
	economic_modifier = 9
	ideal_character_age = 40
	total_positions = 1
	spawn_positions = 1
	alt_titles = list(
		"Director Especializado"
		)
	allowed_branches = list(
		/datum/mil_branch/administration,
		/datum/mil_branch/contractuel,
	)
	outfit_type = /decl/hierarchy/outfit/job/science/superviseur
	access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads, access_tox,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels, access_external_airlocks,
			access_tox_storage, access_teleporter, access_sec_doors,
			access_research, access_robotics, access_xenobiology, access_ai_upload, access_tech_storage,
			access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_xenoarch, access_network, access_rd, access_research, access_medical, access_morgue, access_medical_equip)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads, access_tox,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels, access_external_airlocks,
			access_tox_storage, access_teleporter, access_sec_doors,
			access_research, access_robotics, access_xenobiology, access_ai_upload, access_tech_storage,
			access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_xenoarch, access_network, access_rd, access_research, access_medical, access_morgue, access_medical_equip)

/datum/job/scientist
	title = "Científico"
	supervisors = "el supervisor"
	minimal_player_age = 19
	economic_modifier = 8
	ideal_character_age = 30
	total_positions = 3
	spawn_positions = 3
	alt_titles = list(
		"Físico",
		"Robotista",
		"Químico",
		)
	allowed_branches = list(
		/datum/mil_branch/contractuel
	)

/datum/job/doctor
	title = "Médico"
	selection_color = "#633d63"
	supervisors = "el supervisor"
	minimal_player_age = 19
	economic_modifier = 8
	ideal_character_age = 30
	total_positions = 3
	spawn_positions = 3
	alt_titles = list(
		"Cirujano",
		"Enfermero",
		"Biologo",
		)
	allowed_branches = list(
		/datum/mil_branch/contractuel
	)

/datum/job/hos
	title = "Marshall"
	supervisors = "su empresa"
	minimal_player_age = 19
	economic_modifier = 10
	ideal_character_age = 30
	total_positions = 1
	spawn_positions = 1
	alt_titles = list(
		"Responsable de Seguridad",
		"Mercenario",
		)
	allowed_branches = list(
		/datum/mil_branch/contractuel
	)

/datum/job/qm
	selection_color = "#3d3315"
	title = "Contramaestre"
	supervisors = "el director general"
	minimal_player_age = 21
	economic_modifier = 7
	ideal_character_age = 30
	total_positions = 1
	spawn_positions = 2
	alt_titles = list(
		"Director de Produccion",
		"Coordinador de Produccion",
		)
	allowed_branches = list(
		/datum/mil_branch/administration,
		/datum/mil_branch/contractuel,
		/datum/mil_branch/ouvrier,
	)

/datum/job/engineer
	title = "Ingeniero"
	supervisors = "el contramaestre"
	minimal_player_age = 16
	economic_modifier = 5
	ideal_character_age = 21
	total_positions = 3
	spawn_positions = 3
	alt_titles = list(
		"Mecanico",
		"Técnico de Maquinaria",
		)
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/inge/inge
	allowed_branches = list(
		/datum/mil_branch/contractuel,
		/datum/mil_branch/ouvrier,
	)
	access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics, access_emergency_storage, access_tcomsat)
	minimal_access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics, access_emergency_storage, access_tcomsat)

/datum/job/mining
	selection_color = "#7c6a2e"
	title = "Minero"
	supervisors = "el contramaestre"
	minimal_player_age = 16
	economic_modifier = 2
	ideal_character_age = 21
	total_positions = 2
	spawn_positions = 2
	alt_titles = list(
		"Refinador",
		"Técnico de Minería",
		)
	allowed_branches = list(
		/datum/mil_branch/ouvrier
	)
	access = list(access_maint_tunnels, access_mailsorting, access_manufacturing, access_cargo, access_cargo_bot, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_mailsorting, access_manufacturing, access_cargo, access_cargo_bot, access_mining, access_mining_station)

/datum/job/cargo_tech
	selection_color = "#7c6a2e"
	title = "Técnico de Cargamento"
	supervisors = "el contramaestre"
	minimal_player_age = 16
	economic_modifier = 2
	ideal_character_age = 21
	total_positions = 2
	spawn_positions = 2
	alt_titles = list(
		"Cargador",
		"Operador de Carga",
		)
	allowed_branches = list(
		/datum/mil_branch/ouvrier
	)
	access = list(access_maint_tunnels, access_mailsorting, access_manufacturing, access_cargo, access_cargo_bot, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_mailsorting, access_manufacturing, access_cargo, access_cargo_bot, access_mining, access_mining_station)

/datum/job/ouvrier
	selection_color = "#7c6a2e"
	title = "Obrero"
	supervisors = "el contramaestre"
	minimal_player_age = 16
	economic_modifier = 2
	ideal_character_age = 21
	total_positions = 5
	spawn_positions = 5
	faction = "Station"
	department_flag = SUP
	department = "Supply"
	alt_titles = list(
		"Moldeador",
		"Obrero polivalente",
		)
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/ouvrier
	allowed_branches = list(
		/datum/mil_branch/ouvrier
	)
	announced = 1
	access = list(access_cargo, access_maint_tunnels)
	minimal_access = list(access_cargo, access_maint_tunnels)

/datum/job/chef
	title = "Cocinero"
	supervisors = "los directores y sus clientes"
	minimal_player_age = 16
	economic_modifier = 4
	ideal_character_age = 21
	total_positions = 1
	spawn_positions = 1
	alt_titles = list(
		"Chef",
		)
	allowed_branches = list(
		/datum/mil_branch/ouvrier,
		/datum/mil_branch/contractuel,
	)

/datum/job/chaplain
	title = "Capellan"
	supervisors = "los directores"
	minimal_player_age = 21
	economic_modifier = 6
	ideal_character_age = 30
	total_positions = 1
	spawn_positions = 1
	alt_titles = list(
		"Psicologo",
		)
	allowed_branches = list(
		/datum/mil_branch/contractuel
	)

/datum/job/janitor
	title = "Conserje"
	supervisors = "el contramaestre"
	minimal_player_age = 16
	economic_modifier = 2
	ideal_character_age = 21
	total_positions = 1
	spawn_positions = 1
	alt_titles = list(
		"Técnico de sanitizacion",
		)
	allowed_branches = list(
		/datum/mil_branch/ouvrier
	)

/datum/job/cyborg
	title = "Cyborg"
	alt_titles = list(
		"Robot",
		"Androide",
		)