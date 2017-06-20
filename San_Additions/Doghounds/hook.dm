/hook/startup/proc/modules_vr()
	robot_module_types += "Medihound"
	robot_module_types += "K9"
	robot_module_types += "Janihound"
	return 1

/hook/startup/proc/robot_modules_vr()
	robot_modules["Medihound"] = /obj/item/weapon/robot_module/medihound
	robot_modules["K9"] = /obj/item/weapon/robot_module/knine
	robot_modules["ERT"] = /obj/item/weapon/robot_module/ert
	robot_modules["Janihound"] = /obj/item/weapon/robot_module/scrubpup
	return 1