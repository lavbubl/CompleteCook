function cutscene_ruin_end()
{
	with (obj_player)
	{
		state = states.normal
		x = backtohubstartx
		y = backtohubstarty
	}
	global.levelcomplete = 0
	global.ruincutscene = 1
	quick_ini_write_real(get_savefile_ini(), "cutscene", "ruin", 1)
	cutscene_end_action()
}
