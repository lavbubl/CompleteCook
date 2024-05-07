function cutscene_entrance_end()
{
	with (obj_player)
	{
		state = states.normal
		x = backtohubstartx
		y = backtohubstarty
	}
	global.levelcomplete = 0
	global.entrancecutscene = 1
	quick_ini_write_real(get_savefile_ini(), "cutscene", "entrance", 1)
	cutscene_end_action()
	exit;
}

function cutscene_factory_end()
{
	with (obj_player)
	{
		state = states.normal
		x = backtohubstartx
		y = backtohubstarty
	}
	global.levelcomplete = 0
	global.factorycutscene = 1
	quick_ini_write_real(get_savefile_ini(), "cutscene", "factory", 1)
	cutscene_end_action()
	exit;
}

function cutscene_save_game()
{
	gamesave_async_save()
	cutscene_end_action()
	exit;
}

