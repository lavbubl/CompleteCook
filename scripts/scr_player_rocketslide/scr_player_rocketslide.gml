function scr_player_rocketslide()
{
	hsp = (xscale * movespeed)
	movespeed = Approach(movespeed, 0, 0.5)
	vsp = 0
	if (movespeed <= 0)
	{
		state = states.rocket
		sprite_index = spr_rocket
		image_index = 0
		movespeed = 8
		xscale *= -1
	}
}
