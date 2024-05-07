if (global.farmcutscene == -4)
	global.farmcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "farm", 0)
if global.farmcutscene
	instance_destroy()
