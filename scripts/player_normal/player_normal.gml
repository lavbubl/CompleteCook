function player_normal()
{
	var default_idle = spr.idle
	var default_move = spr.move
	var default_jump = spr.jump
	var default_fall = spr.fall
	
	if has_shotgun
	{
		default_idle = spr_playerP_shotgun_idle
		default_move = spr_playerP_shotgun_move
		default_jump = spr_playerP_shotgun_jump
		default_fall = spr_playerP_shotgun_fall
	}
	if global.panic.active
	{
		default_idle = spr_playerP_panic
		
		if global.panic.timer <= 0
		{
			default_idle = spr_playerP_hurtidle
			default_move = spr_playerP_hurtmove
			default_jump = spr_playerP_hurtjump
			default_fall = spr_playerP_hurtjump
		}
	}
	if p_move != 0
	{
		xscale = p_move
		if !place_meeting(x + p_move, y, obj_solid)
		{
			movespeed = approach(movespeed, 8, movespeed > 8 ? 0.1 : 0.5)
			if (floor(movespeed) == 8)
				movespeed = 6
		}
		else
			movespeed = 0
		if particle_timer > 0
			particle_timer--
		else if sprite_index != spr_playerP_breakdance
		{
			particle_timer = 12
			scr_sound_3d_pitched(sfx_step, x, y)
			create_effect(x, y + 43, spr_cloudeffect)
		}
	}
	else
		movespeed = 0
	
	hsp = movespeed * xscale
	
	var idlegestures = [
		spr_playerP_idlefrown, 
		spr_playerP_idledance, 
		spr_playerP_idlehand, 
		spr_playerP_idlecareless, 
		spr_playerP_idlewhat,
		spr_playerP_idlebite
	]
	
	if p_move != 0
		idletimer = 120
	
	if (breakdance_secret.buffer < 10)
	{
		if p_move != 0
		{
			if (sprite_index != spr_playerP_landmove && sprite_index != spr_playerP_shotgun_land)
				sprite_index = default_move
		}
		else
		{
			if !has_shotgun
			{
				if (idletimer <= 0 && idletimer != -4)
				{
					reset_anim(idlegestures[irandom(5)])
					idletimer = -4
					if irandom(100) >= 50
						scr_sound_pitched(choose(v_pep_bah, v_pep_alright, v_pep_alright_high, v_pep_paranoid, v_pep_paParanoid), 0.5, 1.5)
				}
				
				if (anim_ended() && idletimer == -4)
				{
					reset_anim(default_idle)
					idletimer = 180
				}
			}
			
			if (sprite_index != spr_playerP_machslideend && sprite_index != spr_playerP_land && sprite_index != spr_playerP_bodyslamland && sprite_index != spr_playerP_facehurt && sprite_index != spr_playerP_shotgun_land && idletimer > 0)
				sprite_index = default_idle
		}
	}
	
	image_speed = 0.35
	
	if input.taunt.check
	{
		if breakdance_secret.buffer < 10
			breakdance_secret.buffer++
		else
		{
			sprite_index = spr_playerP_breakdance
			breakdance_secret.spd = approach(breakdance_secret.spd, 0.6, 0.005)
			image_speed = breakdance_secret.spd
		}
		
		if breakdance_secret.spd >= 0.5
		{
			aftimg_timers.blur.do_it = true
			if (!instance_exists(obj_beatbox))
				instance_create(x, y, obj_beatbox)
		}
	}
	else
	{
		breakdance_secret.buffer = 0
		breakdance_secret.spd = 0.25
	}
	
	if (input.down.check || !scr_can_uncrouch())
	{
		reset_anim(!has_shotgun ? spr_playerP_crouchdown : spr_playerP_shotgun_crouchstart)
		state = states.crouch
	}
	
	if !grounded
	{
		dir = xscale
		state = states.jump
		reset_anim(default_fall)
	}
	
	if (coyote_time && input_buffers.jump > 0)
	{
		input_buffers.jump = 0
		vsp = -11
		state = states.jump
		reset_anim(default_jump)
		jumpstop = false
		create_effect(x, y - 5, spr_highjumpcloud2)
		scr_sound_3d(sfx_jump, x, y)
	}
	
	do_grab() //note: intentional game design
	
	if input.dash.check && !scr_hitwall(x + xscale, y)
	{
		state = states.mach2
		if (movespeed < 6)
			movespeed = 6
		reset_anim(spr_playerP_mach1)
	}
	
	switch (sprite_index)
	{
		case spr_playerP_move:
		case spr_playerP_hurtmove:
			image_speed = clamp(movespeed / 15, 0.35, 0.6);
			break;
		case spr_playerP_machslideend:
		case spr_playerP_land:
		case spr_playerP_shotgun_land:
			reset_anim_on_end(default_idle)
			break;
		case spr_playerP_landmove:
			image_speed = clamp(movespeed / 15, 0.35, 0.6);
			reset_anim_on_end(default_move);
			break;
		case spr_playerP_facehurt:
			reset_anim_on_end(default_idle)
			break;
	}
	
	do_taunt()
}