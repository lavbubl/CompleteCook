function player_punchenemy()
{
	image_speed = 0.4
	movespeed = 0
	
	var ixcheck = 4
	if sprite_index == spr_player_swingdingend
		ixcheck = 1
	
	if (floor(image_index) < 4 && sprite_index != spr_player_swingdingend)
		hsp = approach(hsp, 0, 1)
	else
		hsp = approach(hsp, -xscale * 4, 0.5)
	
	if anim_ended()
	{
		sprite_index = spr_player_fall
		state = states.normal
		railmovespeed = 4
        raildir = -xscale
		jumpstop = true
		dir = xscale
	}
	
	aftimg_timers.mach.do_it = true
}
