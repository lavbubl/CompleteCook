function player_hurt()
{
	image_speed = 0.35
	if grounded && vsp >= 0
	{
		state = states.normal
		hsp = 0
		movespeed = 0
	}
}