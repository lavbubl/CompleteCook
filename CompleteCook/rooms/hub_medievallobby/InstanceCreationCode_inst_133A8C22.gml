if (global.ruincutscene2 == -4)
	global.ruincutscene2 = quick_ini_read_real(get_savefile_ini(), "cutscene", "ruin2", 0)
if (!global.ruincutscene2)
	instance_destroy()
content = obj_pizzagoblinbomb
