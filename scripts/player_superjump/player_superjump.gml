function player_superjump() 
{
	if (sprite_index == spr_player_superjumpflash || sprite_index == spr_player_superjumpright || sprite_index == spr_player_superjumpleft)
		hsp = P_MOVE * movespeed
	else
		hsp = xscale * movespeed
	
	image_speed = 0.35
	
	if (sprite_index == spr_player_superjumpprep || sprite_index == spr_player_superjumpflash)
		movespeed = approach(movespeed, 0, 1)
		
	if (sprite_index == spr_player_superjumpprep)
		reset_anim_on_end(spr_player_superjumpflash)
		
	if (sprite_index == spr_player_Sjumpcancelstart)
	{
		image_speed = 0.5
		vsp = 0
		if (P_MOVE != 0)
		  xscale = P_MOVE
	}
	
	var superjumpholding = SJUMPHELD || !grounded || scr_can_uncrouch()
	
	if (superjumpholding && (sprite_index == spr_player_superjumpflash || sprite_index == spr_player_superjumpright || sprite_index = spr_player_superjumpleft))
	{
		var absMove = abs(P_MOVE);
		movespeed = absMove * 2

		if P_MOVE != 0
		{
			if input_direction_check(INPUTS.right)
				sprite_index = (xscale = 1) ? spr_player_superjumpright : spr_player_superjumpleft
			
			if input_direction_check(INPUTS.left)
				sprite_index = (xscale = -1) ? spr_player_superjumpright : spr_player_superjumpleft
		}
		else
			sprite_index = spr_player_superjumpflash
	}
	
	if anim_ended() && sprite_index == spr_player_Sjumpcancelstart
	{
		state = states.mach3
		sprite_index = spr_player_Sjumpcancel
		jumpstop = true
		vsp = -4
		flash = 8
		movespeed = 12
		image_speed = 0.35
		with particle_create(x, y, particles.genericpoof, xscale, 1, spr_crazyruneffect)
			depth = -150
	}
	
	if (sprite_index != spr_player_superjump && sprite_index != spr_player_presentboxspring && sprite_index != spr_player_Sjumpcancel && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_player_superjumpprep && !superjumpholding)
	{
		vsp = -12
		sprite_index = spr_player_superjump
		scr_sound_3d_on(myemitter, sfx_superjumprelease)
		create_effect(x, y, spr_superjumpexplosion)
	}
	
	if (sprite_index == spr_player_superjump || sprite_index == spr_player_presentboxspring)
	{
		instakill = true
		image_speed = abs(vsp) / 25
		if particle_timer > 0
			particle_timer--
		else
		{
			particle_timer = 20
			with create_effect(x, y, spr_piledrivereffect)
			{
				image_yscale = -1
				depth = -150
			}
			create_effect(x, y, spr_cloudeffect)
		}
		movespeed = 0
		
		if scr_solid(x, y - 1)
		{
			state = states.bump
			shake_camera(10, 30 / room_speed)
			reset_anim(spr_player_ceilinghit)
			scr_sound_3d(sfx_groundpound, x, y)
		}
		
		if (sprite_index != spr_player_Sjumpcancelstart)
			vsp -= grav + 0.1
		
		if (input_buffers.grab > 0 || input_check_pressed(INPUTS.dash)) && state != states.bump && sprite_index != spr_player_presentboxspring
		{
			input_buffers.grab = 0
			reset_anim(spr_player_Sjumpcancelstart)
			scr_sound_3d(sfx_superjumpcancel, x, y)
			audio_stop_sound(sfx_superjumprelease)
		}
		
		aftimg_timers.blur.do_it = true
		aftimg_timers.mach.do_it = true
	}
}