function player_ball() 
{
	hsp = xscale * movespeed
	
	if sprite_index != spr_player_ballend
	{
		image_speed = 0.35
		
		if grounded
		{
			var movespeed_target = 10
			if p_move == xscale
				movespeed_target += 2
			else if p_move == -xscale
				movespeed_target -= 2
			movespeed = approach(movespeed, movespeed_target, 0.25)
		}
	
		if grounded && vsp > 0
		{
			jumpstop = false
		
			if !particle_contains_sprite(spr_dashcloud)
			{
				with create_effect(x, y, spr_dashcloud)
					image_xscale = other.xscale
			}
		}
		
		if input_buffers.jump > 0 && grounded
		{
			vsp = -11
			input_buffers.jump = 0
		}
	
		if !input.jump.check && !jumpstop && vsp < 0 && !grounded
		{
			jumpstop = true
			vsp /= 10
		}
		
		if scr_hitwall(x + xscale, y) && !place_meeting(x + xscale, y, obj_rattumbleblock)
		{
			reset_anim(spr_player_ballend) //bellend.,. heh
			scr_sound_3d(sfx_ballhitwall, x, y)
			image_speed = 0
			movespeed = -2
			vsp = -3
			jumpstop = true
		}
	
		aftimg_timers.blur.do_it = true
	}
	else if grounded
	{
		image_speed = 0.35
		state = states.bump
	}
}