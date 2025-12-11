function player_jump()
{
	var default_jump = spr_playerP_jump
	var default_fall = spr_playerP_fall
	var default_land = spr_playerP_land
	var default_landmove = spr_playerP_landmove
	
	if has_shotgun
	{
		default_jump = spr_playerP_shotgun_jump
		default_fall = spr_playerP_shotgun_fall
		default_land = spr_playerP_shotgun_land
		default_landmove = spr_playerP_shotgun_land
	}
	
	if sprite_index == spr_playerP_jump
		sprite_index = default_jump
	else if sprite_index == spr_playerP_fall
		sprite_index = default_fall
	
	if (coyote_time && input_buffers.jump > 0)
	{
		input_buffers.jump = 0
		vsp = -11
		reset_anim(default_jump)
		jumpstop = false
		create_effect(x, y - 5, spr_highjumpcloud2)
		scr_sound_3d(sfx_jump, x, y)
	}
	
	hsp = movespeed * xscale
	
	if p_move == -xscale || movespeed >= 0
		momentum = false
	
	if (p_move != 0)
	{
		movespeed = approach(movespeed, 6, 0.5)
		xscale = p_move
		if dir != xscale
		{
			movespeed = 0
			dir = xscale
		}
	}
	else if momentum
		movespeed = approach(movespeed, 0, 0.5)
	else if (p_move == 0)
		movespeed = 0
		
	if movespeed >= 0
		momentum = false
	
	if place_meeting(x + hsp, y, obj_solid)
		movespeed = 0
	
	if (!jumpstop && !input.jump.check && vsp < 0)
	{
		jumpstop = true
		vsp /= 10
	}
	
	if vsp >= 0
	{
		fallingtimer = min(fallingtimer + 1, 100)
		if fallingtimer >= 50
			sprite_index = fallingtimer < 100 ? spr_playerP_fallface : spr_playerP_freefall
	}
	else
		fallingtimer = 0
	
	if (grounded && vsp >= 0)
	{
		if fallingtimer < 50
		{
			state = states.normal
			reset_anim(movespeed < 1 ? default_land : default_landmove)
			scr_sound_3d_pitched(sfx_step, x, y)
			create_effect(x, y, spr_landeffect)
			if input.dash.check
			{
				state = states.mach2
				movespeed = max(movespeed, 6);
				reset_anim(spr_playerP_mach1)
			}
		}
		else
		{
			reset_anim(sprite_index == spr_playerP_fallface ? spr_playerP_bodyslamland : spr_playerP_freefallland)
			image_index = 0
			state = states.bump
			shake_camera()
			scr_sound_3d(sfx_groundpound, x, y)
			create_effect(x, y + 2, spr_groundpoundeffect)
		}
	}
	
	if has_shotgun //do before if you have the shotgun
		do_groundpound()
	
	if sprite_index != spr_playerP_suplexbump
		do_grab()
	
	if !has_shotgun //do after if you dont have the shotgun
		do_groundpound()
	
	image_speed = 0.35
	switch (sprite_index)
	{
		case spr_playerP_jump:
		case spr_playerP_suplexcancel:
		case spr_playerP_piledriverjump:
			reset_anim_on_end(spr_playerP_fall)
			break;
		case spr_playerP_shotgun_jump:
			reset_anim_on_end(spr_playerP_shotgun_fall)
			break;
		case spr_playerP_stomp:
			if anim_ended()
				image_index = image_number - 3
			break;
		case spr_playerP_hurtjump:
			if anim_ended()
				image_index = image_number - 3
			break;
	}
	
	do_taunt()
}