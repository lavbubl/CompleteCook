function player_actor()
{
	switch (sprite_index)
	{
		case spr_player_exitdoor:
			if anim_ended()
				state = states.normal
			if particle_timer > 0
				particle_timer--
			else
			{
				particle_timer = 14
				scr_sound_3d_pitched(sfx_step, x, y)
				create_effect(x, y + 43, spr_cloudeffect)
			}
			break;
		case spr_player_timesup:
			if anim_ended()
			{
				if room != rm_timesup
					state = states.normal
				else
					image_speed = 0
			}
			break;
		case spr_player_upbox:
			vsp = 0
			break;
	}
}