function player_punchenemy()
{
	image_speed = 0.4
	hsp = approach(hsp, 0, 0.4)
	movespeed = 0
	
	var ixcheck = 7
	
	if sprite_index == spr_player_finishingblowup
		ixcheck = 5
	if sprite_index == spr_player_swingdingend
		ixcheck = 1
	
	if (floor(image_index) == ixcheck)
	{
		hsp = xscale * -5
		vsp = -6
	}
	
	if anim_ended()
		state = states.normal
		
	aftimg_timers.mach.do_it = true
}