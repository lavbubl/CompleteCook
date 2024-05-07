function scr_player_hit()
{
	hsp = 0
	vsp = 0
	x = (hitX + random_range(-4, 4))
	y = (hitY + random_range(-4, 4))
	hitLag--
	xscale = hitxscale
	image_speed = 0
	if (hitLag <= 0)
	{
		scr_soundeffect(sfx_pephurt)
		image_speed = 0.35
		x = hitX
		y = hitY
		if (!(place_meeting(x, (y - 1), obj_solid)))
		{
			y--
			grounded = false
		}
		if scr_solid(x, y)
			y -= 5
		movespeed = abs(hithsp)
		vsp = hitvsp
		state = states.thrown
		stunned = hitstunned
	}
	exit;
}

