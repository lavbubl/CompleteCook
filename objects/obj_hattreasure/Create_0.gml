event_inherited()
got_func = function()
{
	if (global.hatcutscene2 == -4 or (!global.hatcutscene2))
	{
		global.hatcutscene2 = 1
		quick_ini_write_real(get_savefile_ini(), "cutscene", "hat2", 1)
	}
	exit;
}

if (global.hatcutscene1 == -4)
	global.hatcutscene1 = quick_ini_read_real(get_savefile_ini(), "cutscene", "hat1", 0)
if (!global.hatcutscene1)
	instance_destroy()
if (global.hatcutscene2 == -4)
	global.hatcutscene2 = quick_ini_read_real(get_savefile_ini(), "cutscene", "hat2", 0)
if global.hatcutscene2
	instance_destroy()
