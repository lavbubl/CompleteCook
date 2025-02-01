function player_punch()
{
	hsp = approach(hsp, p_move * 4, 0.4)
	
	if image_index < 2
		image_speed = 0.35
	
	if anim_ended()
		image_speed = 0
	
	if grounded
	{
		state = states.normal
		movespeed = abs(hsp)
		if p_move != 0
			xscale = p_move
	}
	
	if (vsp < 0)
	{
		aftimg_timers.mach.do_it = true
		instakill = true
	}
}