function player_tumble() //ball is in its own state, player_ball()
{
	hsp = xscale * movespeed
	
	if !grounded 
	{
		vsp = 10
		sprite_index = spr_player_dive
		fmod_studio_event_instance_oneshot_3d("event:/sfx/player/dive", x, y)
	}
	else if grounded && sprite_index == spr_player_dive
		reset_anim(spr_player_machroll)
		
	if (sprite_index == spr_player_dive && input_buffers.jump > 0)
	{
		input_buffers.jump = 0
		sprite_index = spr_player_poundcancel1
		state = states.groundpound
		vsp = -6
		dir = xscale
	}
	
	if movespeed <= 2
		state = states.normal
		
	if (sprite_index == spr_player_mach2jump && grounded)
		sprite_index = spr_player_machroll
	
	if (sprite_index == spr_player_machroll && movespeed > 12)
		reset_anim_on_end(spr_player_backslide)
	
	if (sprite_index == spr_player_machroll && !grounded)
		sprite_index = spr_player_mach2jump
	
	if (state != states.groundpound && scr_hitwall(x + xscale, y))
	{
		hsp = 0
		movespeed = 0
		state = states.bump
		reset_anim(spr_player_wallsplat)
		fmod_studio_event_instance_oneshot_3d("event:/sfx/player/splat", x, y)
	}
	
	if (grounded && vsp > 0)
	{
		jumpstop = false
		
		if particle_timer <= 0
		{
			create_effect(x, y, spr_dashcloud).image_xscale = xscale
			particle_timer = 10
		}
		else
			particle_timer--
	}
		
	if crouchslipbuffer > 0
		crouchslipbuffer--
		
	if (!input.down.check && grounded && vsp >= 0 && state != states.bump && scr_can_uncrouch() && crouchslipbuffer <= 0)
	{
		if input.dash.check
		{
			if movespeed >= 12
				state = states.mach3
			else
				state = states.mach2
			reset_anim(spr_player_rollgetup)
			fmod_studio_event_instance_start(getup_snd)
		}
		else
		{
			if movespeed > 6
			{
				state = states.slide
				reset_anim(spr_player_machslidestart)
			}
			else
				state = states.normal
		}
	}
	
	if sprite_index == spr_player_dive && vsp < 10
		vsp = 10
	
	image_speed = movespeed / 20
		
	if sprite_index == spr_playerP_backslide && anim_ended()
		image_index = 2
	
	aftimg_timers.blur.do_it = true
}