state = states.normal
dir = 1
playerxoffset = 0
if (global.beachcutscene == -4)
	global.beachcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "beach", 0)
if (!global.beachcutscene)
	instance_destroy()
