function player_mach3() 
{
	hsp = xscale * movespeed
	mach4mode = movespeed > 16
	
	var dashpad = sprite_index == spr_player_dashpad
	
	if (mach4mode)
	{
		if (sprite_index != spr_player_crazyrun)
		{
			flash = 8
			sprite_index = spr_player_crazyrun
		}
		
		if !particle_contains_sprite(spr_crazyruneffect)
		{
			with create_effect(x, y, spr_crazyruneffect)
			{
				image_xscale = other.xscale
				depth = -150
			}
		}
		
		if (flamecloud_buffer > 0)
			flamecloud_buffer--
		else
		{
			flamecloud_buffer = 20
			create_effect(x, y, spr_flamecloud)
		}
	}
	else if (sprite_index == spr_player_crazyrun)
	{
		flash = 8
		sprite_index = spr_player_mach3
	}
	
	if (!particle_contains_sprite(spr_superdashcloud) && grounded)
		particle_create(x, y, particles.genericpoof, xscale, 1, spr_superdashcloud)
	
	if (input_buffers.jump > 0 && coyote_time) 
	{
		input_buffers.jump = 0
		vsp = -11
		jumpstop = false
		reset_anim(spr_player_mach3jump)
		scr_sound_3d(sfx_jump, x, y)
		particle_create(x, y, particles.genericpoof, xscale, 1, spr_jumpdust)
	}
	
	if (grounded)
	{
		if (sprite_index == spr_player_Sjumpcancel)
			sprite_index = spr_player_mach3
		if (!input.dash.check && !dashpad)
		{
			reset_anim(spr_player_machslidestart)
			state = states.slide
			scr_sound_3d(sfx_break, x, y)
		}
		if (p_move != 0 && p_move != xscale && !dashpad)
		{
			reset_anim(spr_player_machslideboost3)
			state = states.slide
			scr_sound_3d_on(myemitter, sfx_machslideboost)
		}
		
		if (movespeed < 20 && p_move == xscale)
			movespeed += mach4mode ? 0.1 : 0.025
			
		if ((input.up.check || input.superjump.check) && !dashpad)
		{
			state = states.superjump
			reset_anim(spr_player_superjumpprep)
		}
	}
	else
	{
		if (!jumpstop && !input.jump.check && vsp < 0)
		{
			jumpstop = true
			vsp /= 10
		}
	}
	
	do_slope_momentum()
	
	if (input.down.check)
	{
		state = states.tumble
		if (grounded)
			reset_anim(spr_player_machroll)
		else
		{
			sprite_index = spr_player_mach2jump
			vsp = 10
		}
		particle_create(x, y, particles.genericpoof, xscale, 1, spr_jumpdust)
	}
	
	do_grab()
	
	if ((!grounded || scr_slope(x, y + 1)) && scr_hitwall(x + xscale, y))
	{
		{
			wallspeed = movespeed
			if (movespeed < 1)
				wallspeed = 1
			else
				movespeed = wallspeed
			state = states.climbwall
		}
	}
	else if (grounded && scr_hitwall(x + xscale, y))
	{
		state = states.bump
		reset_anim(spr_player_mach3hitwall)
		vsp = -6
		hsp = xscale * -6
		shake_camera(20, 40 / room_speed)
		scr_sound_3d(sfx_groundpound, x, y)
		scr_sound_3d(sfx_bumpwall, x, y)
		
		with par_enemy
		{
			if (grounded && vsp >= 0 && bbox_in_camera())
			{
				state = states.stun
				stun_timer = 200
				vsp = -5
				hsp = 0
			}
		}
	}
	image_speed = 0.4
	switch (sprite_index)
	{
		case spr_player_crazyrun:
			image_speed = 0.75
			break;
		case spr_player_mach3jump:
		case spr_player_rollgetup:
		case spr_player_mach3hit:
		case spr_player_dashpad:
			reset_anim_on_end(spr_player_mach3)
			break;
	}
	do_taunt()
	
	aftimg_timers.mach.do_it = true
	instakill = true
	
	if !particle_contains_sprite(spr_mach3charge)
	{
		create_followingeffect(spr_mach3charge, states.mach3, xscale)
		create_followingeffect(spr_speedlines, states.mach3, xscale)
	}
}