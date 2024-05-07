event_inherited()
got_func = function()
{
	if (global.papercutscene == -4 or (!global.papercutscene))
	{
		global.papercutscene = 1
		quick_ini_write_real(get_savefile_ini(), "cutscene", "paper", 1)
	}
	exit;
}

if (global.papercutscene == -4)
	global.papercutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "paper", 0)
if global.papercutscene
	instance_destroy()
