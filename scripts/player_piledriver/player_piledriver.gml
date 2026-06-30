function player_piledriver()
{
	static _pdeffect = 0
	
	image_speed = vsp < 0 || sprite_index == spr_player_piledriverland ? 0.35 : 0.5
	
	if (P_MOVE != 0)
		movespeed = approach(movespeed, 6, 0.2)
	if (P_MOVE == 0 || sprite_index == spr_player_piledriverland || P_MOVE = -dir)
		movespeed = 0
		
	dir = P_MOVE
	
	hsp = movespeed * dir
	if (grounded && sprite_index != spr_player_piledriverland && vsp >= 0)
	{
		with par_enemy
		{
			if (grounded && vsp >= 0 && bbox_in_camera())
			{
				state = states.stun
				stun_timer = 60
				vsp = -11
				xscale *= -1
				hsp = 0
			}
		}
		
		_pdeffect.statetofollow = noone //kill this effect
		shake_camera(20, 30 / room_speed)
		create_effect(x, y + 2, spr_groundpoundeffect)
		reset_anim(spr_player_piledriverland)
		scr_sound_3d(sfx_groundpound, x, y)
	}
	
	if anim_ended() && sprite_index == spr_player_piledriverland
	{
		vsp = -11
		jumpstop = false
		state = states.jump
		prev_ix = image_index
		reset_anim(spr_player_piledriverjump)
	}
	
	if particle_timer2 <= 0
	{
		create_effect(x, y, spr_cloudeffect)
		particle_timer2 = 10
	}
	else
		particle_timer2--
	
	if vsp >= 2
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
				_pdeffect = create_followingeffect(spr_groundpoundcharge, states.piledriver, 1)
			with _pdeffect
			{
				depth = -100
				image_speed = 0.35
			}
			particle_timer = 15
		}
	}
	
	instakill = sprite_index != spr_player_piledriverland
}