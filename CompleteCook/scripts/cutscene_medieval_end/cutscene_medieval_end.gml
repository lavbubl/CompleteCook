function cutscene_medieval_end()
{
	instance_destroy(obj_actor)
	with (obj_player)
	{
		if (object_index != obj_player2 or global.coop)
		{
			state = states.normal
			x = backtohubstartx
			y = backtohubstarty
		}
	}
	global.levelcomplete = 0
	global.medievalcutscene = 1
	quick_ini_write_real(get_savefile_ini(), "cutscene", "medieval", 1)
	cutscene_end_action()
	exit;
}

