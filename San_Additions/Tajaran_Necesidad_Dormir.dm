
#define ui_sleepyness "EAST-1:28,CENTER-3:11"
// Este proc no es perfecto, es una manera "hacky" de añadir un icono sin tener que hacer un nuevo objeto de iconos por especies.
// PROBABLEMENTE haya algún bug, pero eis, es lo que pasa por hacer estas cosas sin cambiar código original xd
// En un futuro hay que ver como refactorizar esto y hacer que sea un icono adicional para la HuD de los gatos, siguiendo a los Diona, por ejemplo.

/***

LA PRUEBA DE CONCEPTO PARA QUE LOS TAJARAN NECSITEN DORMIR

Un handle_enviroment_special con una variable nueva dentro de la especie.

Añadimos bastantes variables adicionales a la especie Tajaran

- Sansaur

***/


// Necesitan dormir
// ¿Se podría hacer en algo que no fuera handle_enviroment_special? Probablemente
/*
	Cosas a añadir:
	1) Chequeos de donde "pueden caer inconscientes a dormir"
	2) Buscar una manera de que no puedan dormir mientras están en medio de una pelea, si es que eso se puede comprobar
	3)
*/
/datum/species/tajaran/handle_environment_special(var/mob/living/carbon/human/H)
	handle_sleep_time(H) // Lo ponemos en otra Proc para que se puedan hacer más cosas en el mismo handle_enviroment_special
	handle_clothing_heat(H)
	// Un icono en la pantalla que empieza siendo null y solamente se inicializa en una fórmula usada por los Tajaran
	// esto solo es usado por los Tajaran REPITO
	// Por ahora - Sansaur
/mob/living/carbon/human
	var/obj/screen/sleepyness_icon
	var/need_for_sleep = 0			// Cuanto avance llevamos para llegar al dormir
	var/sleep_regen_rate = 8		// Cuanto sueño se regenera por tick mientras duerme
	var/sleep_increase_rate = 1		// Cuanto sueño se añade
	var/sleep_decrease_rate = 2		// Cuanto de sueño se quita mientras tomas café
	var/maximum_sleep = 100			// Cuanto sueño se puede acumular
	var/sleep_increase_chance = 3	// Cuanto más alto es este número, antes se irán a dormir. Entre 1 y 100 de posibilidad, por favor - sansaur
	var/sleeping_time = 20			// Cuanto tiempo se les pone a dormir


/datum/species/tajaran/proc/dibujar_icono_dormir(var/intensidad, var/mob/living/carbon/human/H)
	if(!H)
		// Es necesario tener a un humano
		return

	if(!H.client)
		// Es necesario que ese humano tenga cliente
		return

	if(!H.sleepyness_icon)
		var/datum/preferences/Preferencias = H.client.prefs	// Cogemos el color de los ojos para ponerselos a esto
		var/obj/screen/nuevo = new /obj/screen()
		nuevo.icon = 'icono_dormir.dmi'
		nuevo.screen_loc = ui_sleepyness
		nuevo.name = "sleepyness"
		nuevo.color = rgb(Preferencias.r_eyes,Preferencias.g_eyes,Preferencias.b_eyes)
		H.sleepyness_icon = nuevo
		H.client.screen += H.sleepyness_icon

	if(!(H.sleepyness_icon in H.client.screen))
//		to_chat(H, "Añadiendo sleepyness icon") debug
		H.client.screen += H.sleepyness_icon

//	H.client.screen += H.sleepyness_icon

	if(intensidad <= 0)
		H.sleepyness_icon.icon_state = "regenerando" // La intensidad 0 es que se está regenerando
		return
	if(intensidad == 1)
		H.sleepyness_icon.icon_state = "1"
		return
	if(intensidad == 2)
		H.sleepyness_icon.icon_state = "2"
		return
	if(intensidad >= 3)
		H.sleepyness_icon.icon_state = "3"
		return


/datum/species/tajaran/proc/handle_sleep_time(var/mob/living/carbon/human/H)
	// También se reduce la necesidad de dormir con otras sustancias.
	var/list/ReagentsQueQuitanSuenio = list(
		/datum/reagent/drink/coffee,
		/datum/reagent/drink/tea,
		/datum/reagent/sugar
	)

	if(H.ingested)
		var/datum/reagents/metabolism/METABOLISMO = H.ingested
		if(METABOLISMO.reagent_list.len)
			for(var/datum/reagent/COMPROBANDO in METABOLISMO.reagent_list)
				if(is_type_in_list(COMPROBANDO, ReagentsQueQuitanSuenio))
					H.need_for_sleep -= H.sleep_decrease_rate
					if(H.need_for_sleep < 0)
						H.need_for_sleep = 0
					if(prob(3))
						to_chat(H, "<span class='info'> You don't feel as sleepy as before </span>")

	// Si ya estamos durmiendo, se reduce y se acaba el handle enviroment special
	// Actually, si estamos durmiendo sobre algo que NO sea una cama, la regeneración máxima se divide entre 4, reduciendo la efectividad.
	if(H.sleeping)
		dibujar_icono_dormir(0,H)
		var/obj/BED = locate(/obj/structure/bed) in H.loc
		if(BED)
			H.need_for_sleep -= H.sleep_regen_rate
		else
			H.need_for_sleep -= (H.sleep_regen_rate / 4)

		if(H.need_for_sleep < 0)
			H.need_for_sleep = 0
		return


	dibujar_icono_dormir(1,H)
	var/sleep_multiplier = getSleepIncreaseMultiplier(H)
	if(prob(H.sleep_increase_chance))
		H.need_for_sleep += H.sleep_increase_rate * sleep_multiplier

	// al 60% de la dormidera empiezan los mensajes
	if(H.need_for_sleep > (H.maximum_sleep / 1.8))
		dibujar_icono_dormir(2,H)
		if(prob(2))
			to_chat(H, "<span class=info> You're feeling kinda sleepy... </span>")

	// Al 80% empiezan a avisarte mucho
	if(H.need_for_sleep > (H.maximum_sleep / 1.2))
		dibujar_icono_dormir(3,H)
		if(prob(4))
			to_chat(H, "<span class=info> You really should go to sleep now... </span>")
			H.emote("yawn")

	if(H.need_for_sleep > H.maximum_sleep)
		to_chat(H, "<span class=warning> You fall onto [H.loc] exhausted, you really need a quick nap at least... </span>")
		for (var/mob/C in viewers(H))
			if(C == H)
				continue
			C.show_message("<span class=warning> [H] falls flat onto [H.loc] and begins to sleep soundly </span>")

		H.sleeping += H.sleeping_time

/datum/species/tajaran/proc/getSleepIncreaseMultiplier(var/mob/living/carbon/human/H)
	// Cuanto más calor, más modorriña
	var/calor_actual = H.bodytemperature
	var/calor_minimo = body_temperature
	if(calor_actual > calor_minimo)
		var/devolucion = (calor_actual / calor_minimo) + 0.1
		if(devolucion > 1.5)
			devolucion = 1.5
		return devolucion