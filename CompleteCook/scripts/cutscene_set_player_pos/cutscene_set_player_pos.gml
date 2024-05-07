function cutscene_set_player_pos(argument0, argument1)
{
	with (obj_player)
	{
		if (object_index != obj_player2 or global.coop)
		{
			x = argument0
			y = argument1
		}
	}
	cutscene_end_action()
	exit;
}

