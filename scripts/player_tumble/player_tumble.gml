function player_tumble() //ball is in its own state, player_ball()
{
	hsp = xscale * movespeed
	
	if !grounded && sprite_index != spr_playerP_dive
	{
		vsp = 10
		sprite_index = spr_playerP_dive
		scr_sound_3d_pitched(sfx_dive, x, y, 1.3, 1.315)
	}
	else if grounded && sprite_index == spr_playerP_dive
		reset_anim(spr_playerP_machroll)
		
	if (sprite_index == spr_playerP_dive && input_buffers.jump > 0)
	{
		input_buffers.jump = 0
		sprite_index = spr_playerP_poundcancel1
		state = states.groundpound
		vsp = -6
		dir = xscale
	}
	
	if movespeed <= 2
		state = states.normal
		
	if (sprite_index == spr_playerP_mach2jump && grounded)
		sprite_index = spr_playerP_machroll
	
	if (sprite_index == spr_playerP_machroll && movespeed > 12)
		reset_anim_on_end(spr_playerP_backslide)
	
	if (sprite_index == spr_playerP_machroll && !grounded)
		sprite_index = spr_playerP_mach2jump
		
	if (state != states.groundpound && scr_hitwall(x + xscale, y))
	{
		hsp = 0
		movespeed = 0
		state = states.bump
		reset_anim(spr_playerP_wallsplat)
		scr_sound_3d(sfx_splat, x, y)
	}
	
	if (grounded && vsp > 0)
	{
		jumpstop = false
		
		if !particle_contains_sprite(spr_dashcloud)
		{
			with create_effect(x, y, spr_dashcloud)
				image_xscale = other.xscale
		}
	}
		
	if (crouchslipbuffer > 0)
		crouchslipbuffer--
		
	if (!input.down.check && grounded && vsp >= 0 && state != states.bump && scr_can_uncrouch() && crouchslipbuffer <= 0)
	{
		if input.dash.check
		{
			if movespeed >= 12
				state = states.mach3
			else
				state = states.mach2
			reset_anim(spr_playerP_rollgetup)
			scr_sound_3d_on(myemitter, sfx_rollgetup)
		}
		else
		{
			if movespeed > 6
			{
				state = states.slide
				reset_anim(spr_playerP_machslidestart)
			}
			else
				state = states.normal
		}
	}
	
	if (sprite_index == spr_playerP_dive && vsp < 10)
		vsp = 10
		
	if (sprite_index == spr_playerP_machroll)
		image_speed = movespeed / 20
		
	if (sprite_index == spr_playerP_backslide)
	{
		image_speed = movespeed / 20
		if (anim_ended())
			image_index = 2
	}
	
	aftimg_timers.blur.do_it = true
}