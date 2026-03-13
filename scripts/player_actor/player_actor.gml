function player_actor()
{
	switch (sprite_index)
	{
		case spr_player_walkfront:
			if anim_ended()
				state = states.normal
			if particle_timer > 0
				particle_timer--
			else
			{
				particle_timer = 14
				fmod_studio_event_instance_oneshot_3d("event:/sfx/player/step", x, y)
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
		case spr_player_uppizzabox:
			vsp = 0
			break;
		case spr_player_shotgun_pickup: //generic animation end
			if anim_ended()
				state = states.normal
			break;
	}
}