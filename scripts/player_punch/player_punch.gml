function player_punch()
{
	hsp = approach(hsp, p_move * 4, 0.4)
	image_speed = anim_ended() ? 0 : 0.4;
	
	
	if vsp < 0
	{
		aftimg_timers.mach.do_it = true
		instakill = true
		if particle_timer > 0
			particle_timer--
		else
		{
			particle_timer = 5
			create_effect(x, y, spr_shineeffect)
		}
	}
	else if grounded
	{
		state = states.normal
		reset_anim(p_move == 0 ? spr_player_land : spr_player_landmove)
		movespeed = abs(hsp)
		if p_move != 0
			xscale = p_move	
	}
}