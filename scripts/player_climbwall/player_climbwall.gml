function player_climbwall() 
{
	vsp = -wallspeed
	hsp = 0
	
	if (wallspeed < 20000)
		wallspeed += 0.15
	if (wallspeed < 0)
	{
		if (mach4mode == 0)
			movespeed += 0.2
		else
			movespeed += 0.4
	}
	sprite_index = wallspeed > 4 ? spr_player_climbwall : spr_player_clingwall
	image_speed = 0.5
	if (!place_meeting(x + xscale, y, obj_solid))
	{
		vsp = 0
		if (wallspeed < 6)
			wallspeed = 6
		if (wallspeed >= 6 && wallspeed < 12)
		{
			state = states.mach2
			movespeed = wallspeed
		}
		else if (wallspeed >= 12)
		{
			flash = 8
			state = states.mach3
			sprite_index = spr_player_mach3
			movespeed = wallspeed
		}
		x += xscale
	}
	else if scr_solid(x, y - 1)
	{
		state = states.bump
		reset_anim(spr_player_ceilinghit)
		scr_sound_3d(sfx_groundpound, x, y)
	}
	grabclimbbuffer = approach(grabclimbbuffer, 0, 1)
	if (!key_dash.down && grabclimbbuffer <= 0)
	{
		state = states.jump
		sprite_index = spr_player_fall
		movespeed = -5
		jumpstop = false
	}
	if (key_jump.pressed)
	{
		reset_anim(spr_player_walljump)
		movespeed = 10
		state = states.mach2
		vsp = -11
		xscale *= -1
		jumpstop = false
		scr_sound_3d(sfx_jump, x, y)
	}
}