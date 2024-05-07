function cutscene_dungeon_end()
{
	with (obj_player)
	{
		state = states.normal
		x = backtohubstartx
		y = backtohubstarty
	}
	global.levelcomplete = 0
	global.dungeoncutscene = 1
	quick_ini_write_real(get_savefile_ini(), "cutscene", "dungeon", 1)
	cutscene_end_action()
}
