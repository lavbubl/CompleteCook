event_inherited()
got_func = function()
{
	if (global.beercutscene == -4 or (!global.beercutscene))
	{
		global.beercutscene = 1
		quick_ini_write_real(get_savefile_ini(), "cutscene", "beer", 1)
	}
	exit;
}

if (global.beercutscene == -4)
	global.beercutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "beer", 0)
if global.beercutscene
	instance_destroy()
if (global.pinballcutscene == -4)
	global.pinballcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "pinball", 0)
if ((!global.pinballcutscene) && (!global.levelcomplete))
	instance_destroy()
