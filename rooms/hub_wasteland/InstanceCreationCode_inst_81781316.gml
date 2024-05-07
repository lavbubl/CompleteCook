if (global.chieftaincutscene2 == -4)
	global.chieftaincutscene2 = quick_ini_read_real(get_savefile_ini(), "cutscene", "chieftain2", 0)
if global.chieftaincutscene2
	instance_destroy()
