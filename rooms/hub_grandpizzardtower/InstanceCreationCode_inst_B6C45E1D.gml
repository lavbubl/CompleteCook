image_speed = 0.35
if (global.freezercutscene == -4)
	global.freezercutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "freezer", 0)
if (!global.freezercutscene)
	instance_destroy()
