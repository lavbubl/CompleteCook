if (global.noisecutscene1 == -4)
	global.noisecutscene1 = quick_ini_read_real(get_savefile_ini(), "cutscene", "noise1", 0)
if (!global.noisecutscene1)
	instance_destroy()
targetRoom = boss_noise
targetDoor = "A"
