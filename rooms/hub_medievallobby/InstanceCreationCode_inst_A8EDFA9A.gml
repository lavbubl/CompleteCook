if (global.ruincutscene3 == -4)
	global.ruincutscene3 = quick_ini_read_real(get_savefile_ini(), "cutscene", "ruin3", 0)
if global.ruincutscene3
{
	destroy = 0
	instance_destroy()
}
