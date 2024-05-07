targetRoom = space_1
if (global.desertcutscene == -4)
	global.desertcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "desert", 0)
if (!global.desertcutscene)
	instance_destroy()
