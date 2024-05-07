y_to = 1344
if (global.medievalcutscene == -4)
	global.medievalcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "medieval", 0)
if global.medievalcutscene
	y = y_to
