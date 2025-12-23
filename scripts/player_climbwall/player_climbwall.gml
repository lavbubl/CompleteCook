function player_climbwall() 
{
	vsp = -wallspeed
	hsp = 0
	
	wallspeed = min(wallspeed + 0.15, 20)
	
	if (wallspeed < 0)
	{
		if (mach4mode == 0)
			movespeed += 0.2
		else
			movespeed += 0.4
	}
	
	sprite_index = wallspeed > 4 ? spr_player_climbwall : spr_player_clingwall
	image_speed = 0.6
	
	if !scr_hitwall(x + xscale, y)
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
		
		var h = wallspeed
		
		if scr_solid(x, y + h)
		{
			for (var i = 1; i < h; i++) {
			    if !scr_solid(x, y + 1)
					y++
			}
		}
	}
	else if scr_solid(x, y - 1)
	{
		state = states.bump
		reset_anim(spr_player_ceilinghit)
		scr_sound_3d(sfx_groundpound, x, y)
	}
	
	grabclimbbuffer = approach(grabclimbbuffer, 0, 1)
	
	if (!input.dash.check && grabclimbbuffer <= 0)
	{
		state = states.jump
		sprite_index = spr_player_fall
		movespeed = -6
		jumpstop = false
		momentum = true
		dir = xscale
	}
	if (input_buffers.jump > 0)
	{
		input_buffers.jump = 0
		reset_anim(spr_player_walljumpstart)
		movespeed = 10
		state = states.mach2
		vsp = -11
		xscale *= -1
		jumpstop = false
		scr_sound_3d(sfx_jump, x, y)
	}
	
	if (particle_timer > 0)
		particle_timer--
	else
	{
		particle_timer = 8
		create_effect(x + 12 * xscale, y, spr_cloudeffect)
	}
}