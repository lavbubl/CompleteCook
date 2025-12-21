function player_piledriver()
{
	image_speed = 0.35
	if (vsp > 0)
		vsp += 0.5
		
	if (p_move != 0)
		movespeed = approach(movespeed, 4, 0.2)
	if (p_move == 0 || sprite_index == spr_player_piledriverland || p_move = -dir)
		movespeed = 0
		
	dir = p_move
	
	hsp = movespeed * dir
	if (grounded && sprite_index != spr_player_piledriverland && vsp >= 0)
	{
		create_effect(x, y + 2, spr_groundpoundeffect)
		reset_anim(spr_player_piledriverland)
		shake_camera()
		scr_sound_3d(sfx_groundpound, x, y)
	}
	
	if anim_ended() && sprite_index == spr_player_piledriverland
	{
		vsp = -6
		jumpstop = false
		state = states.jump
		prev_ix = image_index
		reset_anim(spr_player_piledriverjump)
	}
	
	if !particle_contains_sprite(spr_cloudeffect)
		create_effect(x, y, spr_cloudeffect)
	
	if vsp >= 0
	{
		vsp += 0.5
		aftimg_timers.mach.do_it = true
		if particle_timer > 0
			particle_timer--
		else
		{
			if !particle_contains_sprite(spr_piledrivereffect)
			{
				with create_effect(x, y, spr_piledrivereffect)
					depth = -150
			}
			if !particle_contains_sprite(spr_groundpoundcharge)
				create_followingeffect(spr_groundpoundcharge, states.groundpound, xscale)
			particle_timer = 15
		}
	}
	
	instakill = true
}