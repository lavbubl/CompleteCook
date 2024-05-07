targetRoom = medieval_1
if (global.chateauswap == -4)
	global.chateauswap = quick_ini_read_real(get_savefile_ini(), "cutscene", "chateauswap", 0)
if global.chateauswap
	instance_destroy()
