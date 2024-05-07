event_inherited()
got_func = function()
{
	if (global.graffiticutscene == -4 or (!global.graffiticutscene))
	{
		global.graffiticutscene = 1
		quick_ini_write_real(get_savefile_ini(), "cutscene", "graffiti", 1)
	}
	exit;
}

if (global.graffiticutscene == -4)
	global.graffiticutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "graffiti", 0)
if global.graffiticutscene
	instance_destroy()
if (global.streetcutscene == -4)
	global.streetcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "street", 0)
if ((!global.streetcutscene) && (!global.levelcomplete))
	instance_destroy()
