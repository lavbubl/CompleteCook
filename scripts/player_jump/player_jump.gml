function player_jump()
{
	if (p_move != 0)
	{
		movespeed = approach(movespeed, 6, 0.5)
		xscale = p_move
	}
	else if (p_move == 0 || xscale != p_move)
		movespeed = 0
	
	hsp = movespeed * xscale
	
	if place_meeting(x + hsp, y, obj_solid)
		movespeed = 0
	
	if (!jumpstop && !key_jump.down && vsp < 0)
	{
		jumpstop = true
		vsp /= 10
	}
	
	if vsp >= 0
	{
		fallingtimer = min(fallingtimer + 1, 100)
		if fallingtimer >= 50
			sprite_index = fallingtimer < 100 ? spr_player_fallface : spr_player_fallfar
	}
	else
		fallingtimer = 0
	
	if (grounded && vsp >= 0)
	{
		if fallingtimer < 50
		{
			state = states.normal
			reset_anim(movespeed < 1 ? spr_player_land : spr_player_landmove)
			scr_sound_3d_pitched(sfx_step, x, y)
			create_effect(x, y, spr_landeffect)
			if key_dash.down
			{
				state = states.mach2
				movespeed = max(movespeed, 6);
				reset_anim(spr_player_mach1)
			}
		}
		else
		{
			reset_anim(sprite_index == spr_player_fallface ? spr_player_bodyslamland : spr_player_fallfarland)
			image_index = 0
			state = states.bump
			shake_camera()
			scr_sound_3d(sfx_groundpound, x, y)
			create_effect(x, y + 2, spr_groundpoundeffect)
		}
	}
	
	if sprite_index != spr_player_grabbump
		do_grab()
	do_groundpound()
	
	
	image_speed = 0.35
	switch (sprite_index)
	{
		case spr_player_jump:
		case spr_player_grabcancel:
		case spr_player_piledriverjump:
			reset_anim_on_end(spr_player_fall)
			break;
		case spr_player_stomp:
			if anim_ended()
				image_index = image_number - 3
			break;
		case spr_player_weakjump:
			if anim_ended()
				image_index = image_number - 3
			break;
	}
	do_taunt()
}