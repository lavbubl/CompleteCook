if (global.spacecutscene == -4)
	global.spacecutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "space", 0)
if (!global.spacecutscene)
	instance_destroy()
