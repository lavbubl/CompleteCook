function player_mach2() 
{
	hsp = xscale * movespeed
	
	if (grounded && vsp >= 0)
	{
		if (sprite_index != spr_player_mach1 && sprite_index != spr_player_rollgetup)
			sprite_index = spr_player_mach2
		if (!input.dash.check)
		{
			if (movespeed < 8)
			{
				state = states.normal
				movespeed = 0
			}
			else
			{
				reset_anim(spr_player_machslidestart)
				state = states.slide
				scr_sound_3d(sfx_break, x, y)
			}
		}
		if (p_move != 0 && p_move != xscale && grounded)
		{
			if (movespeed < 8)
			{
				xscale = p_move
				movespeed = 6
			}
			else
			{
				reset_anim(spr_player_machslideboost)
				state = states.slide
				scr_sound_3d_on(myemitter, sfx_machslideboost)
			}
		}
		if movespeed < 12
			movespeed += 0.1
		else
		{
			state = states.mach3
			flash = 8
			if sprite_index != spr_player_rollgetup
				sprite_index = spr_player_mach3
			if sprite_index == spr_playerN_spincancel
				scr_sound_3d(sfx_N_machland, x, y)
		}
		if particle_timer <= 0
		{
			create_effect(x, y, spr_dashcloud).image_xscale = xscale
			particle_timer = 10
		}
		else
			particle_timer--
	}
	else
	{
		if (sprite_index != spr_player_secondjump && 
			sprite_index != spr_player_secondjumploop && 
			sprite_index != spr_player_walljumpstart && 
			sprite_index != spr_player_walljumpend && 
			sprite_index != spr_player_longjump &&
			sprite_index != spr_player_mach2jump &&
			sprite_index != spr_playerN_spincancel)
			reset_anim(spr_player_secondjump)
		if (!jumpstop && !input.jump.check && vsp < 0)
		{
			jumpstop = true
			vsp /= 10
		}
	}
	
	if character == characters.noise && grounded && ((input.up.check && input_buffers.jump > 0) || input.superjump.pressed) && vsp >= 0
	{
		input_buffers.jump = 0
		state = states.superjump
		reset_anim(spr_player_superjumpprep)
		exit;
	}
	
	if (input_buffers.jump > 0 && coyote_time) 
	{
		input_buffers.jump = 0
		jumpstop = false
		vsp = -11
		scr_sound_3d(sfx_jump, x, y)
		particle_create(x, y, particles.genericpoof, xscale, 1, spr_jumpdust)
	}
	
	do_slope_momentum()
	
	if (input.down.check)
	{
		state = states.tumble
		if grounded
			reset_anim(spr_player_machroll)
		else
		{
			sprite_index = spr_player_mach2jump
			vsp = 10
		}
		particle_create(x, y, particles.genericpoof, xscale, 1, spr_jumpdust)
	}
	if ((!grounded || scr_slope(x, y + 1)) && scr_hitwall(x + xscale, y))
	{
		if character == characters.peppino
		{
			wallspeed = movespeed
			if (movespeed < 1)
				wallspeed = 1
			else
				movespeed = wallspeed
			state = states.climbwall
		}
		else if character == characters.noise && !scr_goupwall()
		{
			movespeed = 0
			vsp = -17 + wallbouncedampen
			wallbouncedampen += 2.55
			state = states.wallbounce
			sprite_index = spr_playerN_wallbounce
			particle_create(x, y, particles.noisebump)
		}
	}
	else if (grounded && scr_hitwall(x + xscale, y))
	{
		state = states.bump
		reset_anim(spr_player_wallsplat)
		scr_sound_3d(sfx_splat, x, y)
	}
	
	do_grab()
	
	image_speed = abs(movespeed) / 15
	switch (sprite_index)
	{
		case spr_player_mach1:
			reset_anim_on_end(spr_player_mach2)
			break;
		case spr_player_secondjump:
			reset_anim_on_end(spr_player_secondjumploop)
			break;
		case spr_player_walljumpstart:
			reset_anim_on_end(spr_player_walljumpend)
			break;
		case spr_player_rollgetup:
			image_speed = 0.4
			reset_anim_on_end(spr_player_mach2)
			break;
		case spr_player_longjump:
			image_speed = 0.4
			if anim_ended()
			{
				image_index = 10
				if character == characters.noise
					image_index++
			}
			break;
		case spr_playerN_spincancel:
			if anim_ended()
				image_index = 10
			break;
	}
	
	if character == characters.noise
		do_crusher()
	
	do_taunt()
	
	aftimg_timers.mach.do_it = true
}