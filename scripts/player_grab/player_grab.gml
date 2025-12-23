function player_grab() 
{
	hsp = xscale * movespeed
	
	if (movespeed < 10)
		movespeed += 0.5
	
	if (!input.jump.check && !jumpstop && vsp < 0.5)
	{
		vsp /= 20
		jumpstop = true
	}
	
	if (input_buffers.jump > 0 && !input.down.check && coyote_time)
	{
		input_buffers.jump = 0
		jumpstop = false
		vsp = -11
		state = states.mach2
		reset_anim(spr_player_longjump)
		scr_sound_3d_on(myemitter, sfx_rollgetup)
		particle_create(x, y, particles.genericpoof, xscale, 1, spr_jumpdust)
	}
	
	if (input.down.check && !input.jump.check && grounded)
	{
		movespeed = 12
		crouchslipbuffer = 25
		state = states.tumble
		sprite_index = spr_player_crouchslip
		scr_sound_3d(sfx_dive, x, y)
		particle_create(x, y, particles.genericpoof, xscale, 1, spr_jumpdust)
	}
	
	if (sprite_index == spr_player_suplexdash && !grounded)
		reset_anim(spr_player_suplexgrabjump)
	
	if (grounded && sprite_index == spr_player_suplexgrabjump && image_index >= 4 && input.dash.check)
	{
		state = states.mach2
		sprite_index = spr_player_mach2
	}
	
	if (scr_hitwall(x + xscale, y) && !grounded)
	{
		wallspeed = 6
		grabclimbbuffer = 10
		state = states.climbwall
	}
	else if (scr_hitwall(x + xscale, y) && grounded)
	{
		sprite_index = spr_player_suplexbump
		state = states.jump
		jumpstop = true
		hsp = 0
		movespeed = 0
		vsp = -5
		scr_sound_3d(sfx_splat, x, y)
		create_effect(x + (16 * xscale), y, spr_bumpeffect)
	}
	
	image_speed = 0.35
	switch (sprite_index)
	{
		case spr_player_suplexdash:
			if anim_ended()
				state = states.normal
			break;
		case spr_player_suplexgrabjump:
			if anim_ended()
				image_index = 4
			if (grounded && !input.dash.check && image_index >= 4)
				state = states.normal
			break;
	}
	
	if anim_ended() && input.dash.check && sprite_index == spr_player_suplexdash
	{
		state = states.mach2
		sprite_index = spr_player_mach2
	}
	
	if p_move != 0 && p_move != xscale
	{
		if !grounded
		{
			reset_anim(spr_player_suplexcancel)
			state = states.jump
		}
		else
			state = states.normal
		movespeed = 0
	}
	
	if state == states.normal
		dir = p_move
	
	aftimg_timers.blur.do_it = true
}