if (global.vigilantecutscene3 == -4)
	global.vigilantecutscene3 = quick_ini_read_real(get_savefile_ini(), "cutscene", "vigilante3", 0)
if global.vigilantecutscene3
{
	destroy = 0
	instance_destroy()
}
