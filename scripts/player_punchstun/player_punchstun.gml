function player_punchstun()
{
	hsp = movespeed * xscale
	movespeed = approach(movespeed, 0, 0.2)
	
	if round(image_index) == image_number - 1
	{
		image_index = image_number - 1
		image_speed = 0
	}
	
	if movespeed == 0
	{
		state = states.normal
		image_speed = 0.35
	}
}