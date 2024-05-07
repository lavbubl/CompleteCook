if (global.vigilantecutscene1 == -4)
	global.vigilantecutscene1 = quick_ini_read_real(get_savefile_ini(), "cutscene", "vigilante1", 0)
if (!global.vigilantecutscene1)
	instance_destroy()
targetRoom = boss_vigilante
targetDoor = "A"
