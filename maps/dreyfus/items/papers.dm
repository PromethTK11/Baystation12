/obj/item/weapon/paper/objectifs_dreyfus
	name = "Requerimientos de producción"
	info = "Requirimientos de producción emitidos por los accionistas :<br><br>"
	icon_state = "paper_words"

/obj/item/weapon/paper/objectifs_dreyfus/New()
	..()
	var/list/products = list(
	"<bold>cubetas (buckets)</bold>",
	"<bold>linternas (flashlights)</bold>",
	"<bold>extintores (extinguishers)</bold>",
	"<bold>jarras (jars)</bold>",
	"<bold>palancas (crowbars)</bold>",
	"<bold>multi-herramientas (multitools)</bold>",
	"<bold>escáneres de rayos-T (T-ray scanners)</bold>",
	"<bold>herramientas de soldadura (welding tools)</bold>",
	"<bold>circuitos de compuertas (airlock electronics)</bold>",
	"<bold>jeringas (syringes)</bold>",
	"<bold>vasos de precipitado (glass beakers)</bold>",
	"<bold>temporizadores (timers)</bold>",
	"<bold>tubos fluorescente (light tubs)</bold>",
	"<bold>bombillas (light bulbs)</bold>",
	"<bold>piezas de ensamblaje de cámaras (camera assemblies)</bold>",
	"<bold>pantallas de consola (console screens)</bold>" )

	var/amount_objectives_high
	var/proba_objectives_high = rand(100)
	if(proba_objectives_high < 50)
		amount_objectives_high = 1
	if(proba_objectives_high > 50 && proba_objectives_high < 80)
		amount_objectives_high = 2
	if(proba_objectives_high > 80)
		amount_objectives_high = 3

	var/amount_objectives_low
	var/proba_objectives_low = rand(100)
	if(proba_objectives_low < 50)
		amount_objectives_low = 2
	if(proba_objectives_low > 50 && proba_objectives_high < 80)
		amount_objectives_low = 4
	if(proba_objectives_low > 80)
		amount_objectives_low = 6

	for(var/i = 1; i <= amount_objectives_high, i++)
		if(products.len < 1) break
		var/S = pick(products)
		info += "Existe una fuerte demanda de [S]<br>"
		products.Remove(S)

	info+="<br>"

	for(var/i = 1; i <= amount_objectives_low, i++)
		if(products.len < 1) break
		var/S = pick(products)
		info += "Sigue existiendo poca demanda de [S]<br>"
		products.Remove(S)


	info+="<br>Es imprescindible que se cumplan los requerimientos de producción.<br><br>-Dirección Central"
