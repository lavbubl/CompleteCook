stationned = 1
if (global.chieftaincutscene == -4)
	global.chieftaincutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "chieftain", 0)
if (!global.chieftaincutscene)
	instance_destroy()
