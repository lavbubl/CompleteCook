function player_punch()
{
	hsp = approach(hsp, P_MOVE * 4, 0.4)
	image_speed = anim_ended() ? 0 : 0.4;
	
	if vsp < 0
	{
		aftimg_timers.mach.do_it = true
		instakill = true
	}
	else if grounded
	{
		state = states.normal
		reset_anim(P_MOVE == 0 ? spr_player_land : spr_player_landmove)
		movespeed = abs(hsp)
		if P_MOVE != 0
		{
			xscale = P_MOVE
			dir = P_MOVE
		}
	}
}