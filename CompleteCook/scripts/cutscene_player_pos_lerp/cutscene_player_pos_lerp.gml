function cutscene_player_pos_lerp(argument0, argument1, argument2)
{
	var _finish = 0
	with (obj_player)
	{
		hsp = 0
		vsp = 0
		if (object_index != obj_player2 or global.coop)
		{
			x = lerp(x, argument0, argument2)
			y = lerp(y, argument1, argument2)
			if (x > (argument0 - 4) && x < (x + 4) && y > (argument1 - 4) && y < (argument1 + 4))
				_finish = 1
		}
	}
	if _finish
		cutscene_end_action()
	exit;
}

