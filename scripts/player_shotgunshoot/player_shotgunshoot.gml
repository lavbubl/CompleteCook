function player_shotgunshoot()
{
	image_speed = 0.4
	hsp = xscale * movespeed
	if scr_hitwall(x + hsp, y)
		movespeed = 0
	if p_move != 0
	{
		if p_move == xscale
			movespeed = approach(movespeed, 4, 0.25)
		else
			movespeed = approach(movespeed, -8, 0.2)
	}
	else
		movespeed = approach(movespeed, 0, 0.1)
	if anim_ended()
	{
		if grounded
			state = states.normal
		else
		{
			state = states.jump
			reset_anim(spr_player_shotgun_fall)
		}
		if p_move == -xscale
		{
			xscale = p_move
			dir = xscale
			movespeed = abs(movespeed)
		}
	}
	if image_index > image_number - 3
		do_grab()
}
