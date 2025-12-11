function player_punchenemy()
{
	image_speed = 0.4
	hsp = approach(hsp, 0, 0.4)
	movespeed = 0
	
	var ixcheck = 5
	if sprite_index == spr_playerP_swingdingend
		ixcheck = 1
	
	if (floor(image_index) == ixcheck)
	{
		hsp = xscale * -4
		vsp = -6
	}
	
	if (floor(image_index) < 4 && sprite_index != spr_playerP_swingdingend)
		hsp = approach(hsp, 0, 1)
	else
		hsp = approach(hsp, -xscale * 4, 0.5)
	
	if anim_ended()
	{
		state = states.normal
		movespeed = abs(hsp)
	}
		
	aftimg_timers.mach.do_it = true
}