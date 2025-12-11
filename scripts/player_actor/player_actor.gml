function player_actor()
{
	switch (sprite_index)
	{
		case spr_playerP_walkfront:
			if anim_ended()
				state = states.normal
			if particle_timer > 0
				particle_timer--
			else
			{
				particle_timer = 14
				scr_sound_3d_pitched(sfx_step, x, y)
			}
			break;
		case spr_playerP_timesup:
			if anim_ended()
			{
				if room != rm_timesup
					state = states.normal
				else
					image_speed = 0
			}
			break;
		case spr_playerP_uppizzabox:
			vsp = 0
			break;
		case spr_playerP_shotgun_pickup: //generic animation end
			if anim_ended()
				state = states.normal
			break;
	}
}