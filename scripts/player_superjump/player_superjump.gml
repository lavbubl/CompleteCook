function player_superjump() 
{
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
		if (p_move != 0)
		  xscale = p_move
	}
	
	if ((key_up.down || !grounded) && (sprite_index == spr_player_superjumpflash || sprite_index == spr_player_superjumpmove))
	{
		if (!place_meeting(x + xscale, y, obj_solid))
			movespeed = 2 * abs(p_move)
		else
			movespeed = 0
		if (abs(p_move))
		{
			xscale = p_move
			sprite_index = spr_player_superjumpmove
		}
		else
			sprite_index = spr_player_superjumpflash
	}
	
	if (anim_ended() && sprite_index == spr_player_Sjumpcancelstart)
	{
		state = states.mach3
		sprite_index = spr_player_Sjumpcancel
		jumpstop = true
		vsp = -4
		flash = 8
		movespeed = 12
		image_speed = 0.35
	}
	
	if (sprite_index != spr_player_superjump && sprite_index != spr_player_Sjumpcancel && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_player_superjumpprep && !key_up.down && grounded)
	{
		vsp = -11
		sprite_index = spr_player_superjump
		scr_sound_3d(sfx_superjumprelease, x, y)
	}
	
	if (sprite_index == spr_player_superjump)
	{
		instakill = true
		image_speed = abs(vsp) / 25
		/*if (superjumpeffecttimer > 0)
			superjumpeffecttimer--
		else
		{
			superjumpeffecttimer = 20
			createEffect('superjumpeffect', depth + 1)
			createEffect('genericdust')
		}*/
		movespeed = 0
		
		if (place_meeting(x, y - 1, obj_solid))
		{
			reset_anim(spr_player_ceilinghit)
			state = states.bump
			scr_sound_3d(sfx_groundpound, x, y)
		}
		
		if (sprite_index != spr_player_Sjumpcancelstart)
			vsp -= 0.6
		
		if (key_attack.pressed && state != states.bump)
		{
			reset_anim(spr_player_Sjumpcancelstart)
			scr_sound_3d(sfx_superjumpcancel, x, y)
			audio_stop_sound(sfx_superjumprelease)
		}
		
		aftimg_timers.blur.do_it = true
	}
}