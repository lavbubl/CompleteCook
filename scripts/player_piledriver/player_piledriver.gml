function player_piledriver()
{
	image_speed = 0.35
	if (vsp > 0)
		vsp += 0.5
		
	if (p_move != 0)
		movespeed = approach(movespeed, 4, 0.2)
	if (p_move == 0 || sprite_index == spr_playerP_piledriverland)
		movespeed = 0
		
	dir = p_move
	
	hsp = movespeed * dir
	if (grounded && sprite_index != spr_playerP_piledriverland && vsp >= 0)
	{
		reset_anim(spr_playerP_piledriverland)
		shake_camera()
		scr_sound_3d(sfx_groundpound, x, y)
	}
	
	if vsp >= 10
	{
		if !particle_contains_sprite(spr_groundpoundcharge)
			create_followingeffect(spr_groundpoundcharge, states.piledriver, xscale)
	}
	
	instakill = true
}