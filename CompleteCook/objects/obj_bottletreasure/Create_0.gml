event_inherited()
got_func = function()
{
	if (global.bottlecutscene == -4 or (!global.bottlecutscene))
	{
		global.bottlecutscene = 1
		quick_ini_write_real(get_savefile_ini(), "cutscene", "bottle", 1)
	}
	exit;
}

if (global.bottlecutscene == -4)
	global.bottlecutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "bottle", 0)
if global.bottlecutscene
	instance_destroy()
