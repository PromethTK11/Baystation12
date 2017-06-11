/datum/map/dreyfus
	branch_types = list(
		/datum/mil_branch/ouvrier,
		/datum/mil_branch/contractuel,
		/datum/mil_branch/administration
	)

	spawn_branch_types = list(
		/datum/mil_branch/ouvrier,
		/datum/mil_branch/contractuel,
		/datum/mil_branch/administration
	)

/datum/mil_branch/ouvrier
	name = "Obrero"
	name_short = "OBR"
	email_domain = "extraposte.free.nt"

	assistant_job = "Pasajero"

/datum/mil_branch/contractuel
	name = "Contractual"
	name_short = "CTRAT"
	email_domain = "gocourriel.uni.nt"

	assistant_job = "Aprendiz"

/datum/mil_branch/administration
	name = "Administracion"
	name_short = "ADMIN"
	email_domain = "intranet.nano"

	assistant_job = "Secretario"