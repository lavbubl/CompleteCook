if (global.vigilantecutscene2 == -4)
	global.vigilantecutscene2 = quick_ini_read_real(get_savefile_ini(), "cutscene", "vigilante2", 0)
if global.vigilantecutscene2
	instance_destroy()
