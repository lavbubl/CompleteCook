function player_tumble() 
{
	hsp = xscale * movespeed
	
	if (!grounded && (sprite_index == spr_player_crouchslip || sprite_index == spr_player_machroll || sprite_index == spr_player_mach2jump || sprite_index == spr_player_backslide))
	{
		vsp = 10
		sprite_index = spr_player_dive
		scr_sound_3d_pitched(sfx_dive, x, y, 1.3, 1.315)
	}
	if (sprite_index == spr_player_ball && grounded)
	{
		if (p_move == xscale)
			movespeed = approach(movespeed, 12, 0.25)
		else if (p_move == -xscale)
			movespeed = approach(movespeed, 8, 0.25)
		else
			movespeed = approach(movespeed, 10, 0.25)
	}
	if (grounded && sprite_index == spr_player_dive)
		reset_anim(spr_player_machroll)
	if (sprite_index == spr_player_dive && key_jump.pressed)
	{
		sprite_index = spr_player_poundcancel1
		state = states.groundpound
		vsp = -6
		dir = xscale
		scr_sound_3d_pitched(sfx_dive, x, y, 1.3, 1.315)
	}
	if movespeed <= 2
		state = states.normal
	if (sprite_index == spr_player_mach2jump && grounded)
		sprite_index = spr_player_machroll
	/*if (sprite_index == spr_player_crouchslip && !grounded)
		sprite_index = spr_player_jumpdive2'
	if (sprite_index == 'jumpdive2' && grounded)
		sprite_index = spr_player_crouchslip*/
	if (sprite_index == spr_player_machroll && movespeed > 12)
		reset_anim_on_end(spr_player_backslide)
	if (sprite_index == spr_player_machroll && !grounded)
		sprite_index = spr_player_mach2jump
	//if (state != 'groundpound' && place_meeting(x + xscale, y, obj_solid))
	if place_meeting(x + xscale, y, obj_solid)
	{
		hsp = 0
		movespeed = 0
		/*if (sprite_index == spr_player_ball || sprite_index == 'tumblestart)
		{
			state = states.bump
			sprite_index = spr_player_tumbleend'
			hsp = -xscale * 2
			vsp = -3
			jumpstop = true
		}
		else
		{*/
			state = states.bump
			reset_anim(spr_player_wallsplat)
		//}
	}
	if (grounded && vsp > 0)
		jumpstop = false
	if (key_jump.pressed && state != states.bump && hsp != 0 && sprite_index == spr_player_ball)
		vsp = -11
	if (crouchslipbuffer > 0)
		crouchslipbuffer--
	//if (!key_down.down && key_dash.down && grounded && state != 1000 && (sprite_index != spr_player_ball && sprite_index != 'tumbleend) && !canuncrouch.isTouching(solids))
	if (!key_down.down && key_dash.down && grounded && !scr_solid(x, y - 16) && crouchslipbuffer <= 0)
	{
		if (movespeed >= 12)
			state = states.mach3
		else
			state = states.mach2
		reset_anim(spr_player_rollgetup)
		scr_sound_3d(sfx_rollgetup, x, y)
	}
	//if (!keyDown('down.pressed && !keyDown('shift.pressed && grounded && vsp > 0 && state != 'bump' && (sprite_index != spr_player_ball && sprite_index != 'tumbleend.pressed && sprite_index != 'breakdance' && !canuncrouch.isTouching(solids))
	if (!key_down.down && !key_dash.down && grounded && vsp > 0 && state != states.bump && !scr_solid(x, y - 16) && crouchslipbuffer <= 0)
	{
		if (movespeed > 6)
		{
			state = states.slide
			reset_anim(spr_player_machslidestart)
		}
		else
			state = states.normal
	}
	if (sprite_index == spr_player_dive && vsp < 10)
		vsp = 10
	if (sprite_index == spr_player_machroll)
		image_speed = movespeed / 20
	if (sprite_index == spr_player_backslide)
	{
		image_speed = movespeed / 20
		if (anim_ended())
			image_index = 2
	}
	aftimg_timers.blur.do_it = true
}