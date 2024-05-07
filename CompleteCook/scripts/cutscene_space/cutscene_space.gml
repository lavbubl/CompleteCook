function cutscene_space_middle()
{
	instance_create(1024, -128, obj_cheeseboat)
	cutscene_end_action()
}

function cutscene_space_end()
{
	with (obj_player)
	{
		state = states.normal
		x = backtohubstartx
		y = backtohubstarty
	}
	global.levelcomplete = 0
	global.spacecutscene = 1
	global.levelcompletename = -4
	quick_ini_write_real(get_savefile_ini(), "cutscene", "space", 1)
	cutscene_end_action()
}
