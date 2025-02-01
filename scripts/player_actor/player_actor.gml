function player_actor()
{
	switch (sprite_index)
	{
		case spr_player_exitdoor:
		case spr_player_timesup:
			if anim_ended()
				state = states.normal
			break;
		case spr_player_upbox:
			vsp = 0
			break;
	}
}