function player_normal()
{
	var default_idle = spr_player_idle
	var default_move = spr_player_move
	var default_jump = spr_player_jump
	
	if has_shotgun
	{
		default_idle = spr_player_shotgun_idle
		default_move = spr_player_shotgun_move
		default_jump = spr_player_shotgun_jump
	}
	if global.panic.active
	{
		default_idle = spr_player_panic
		
		if global.panic.timer <= 0
		{
			default_idle = spr_player_hurtidle
			default_move = spr_player_hurtmove
			default_jump = spr_player_hurtjump
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
		else if sprite_index != spr_player_breakdance
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
		spr_player_idlefrown, 
		spr_player_idledance, 
		spr_player_idlehand, 
		spr_player_idlecareless, 
		spr_player_idlewhat,
		spr_player_idlebite
	]
	
	if p_move != 0
		idletimer = 120
	
	if (breakdance_secret.buffer < 10)
	{
		if p_move != 0
		{
			if (sprite_index != spr_player_landmove && sprite_index != spr_player_shotgun_land)
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
				}
			
				if (anim_ended() && idletimer == -4)
				{
					reset_anim(default_idle)
					idletimer = 180
				}
			}
			
			if (sprite_index != spr_player_machslideend && sprite_index != spr_player_land && sprite_index != spr_player_bodyslamland && sprite_index != spr_player_facehurt && sprite_index != spr_player_shotgun_land && idletimer > 0)
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
			sprite_index = spr_player_breakdance
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
		reset_anim(!has_shotgun ? spr_player_crouchdown : spr_player_shotgun_crouchstart)
		state = states.crouch
	}
	
	if !grounded
	{
		state = states.jump
		reset_anim(default_jump)
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
	
	if (input.dash.check && !place_meeting(x + xscale, y, obj_solid))
	{
		state = states.mach2
		if (movespeed < 6)
			movespeed = 6
		reset_anim(spr_player_mach1)
	}
	
	switch (sprite_index)
	{
		case spr_player_move:
		case spr_player_hurtmove:
			image_speed = clamp(movespeed / 15, 0.35, 0.6);
			break;
		case spr_player_machslideend:
		case spr_player_land:
		case spr_player_shotgun_land:
			reset_anim_on_end(default_idle)
			break;
		case spr_player_landmove:
			image_speed = clamp(movespeed / 15, 0.35, 0.6);
			reset_anim_on_end(default_move);
			break;
		case spr_player_facehurt:
			reset_anim_on_end(default_idle)
			break;
	}
	
	do_taunt()
}