function player_parry()
{
	hsp = xscale * movespeed
	
	if movespeed < 0
		movespeed += 0.5
	else
		movespeed = 0
	
	image_speed = 0.5
	
	if anim_ended()
		state = states.normal
}
