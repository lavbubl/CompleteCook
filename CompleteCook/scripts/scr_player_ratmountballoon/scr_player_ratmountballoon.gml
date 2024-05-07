function scr_player_ratmountballoon()
{
	sprite_index = spr_player_ratmountballoon
	hsp = movespeed
	move = (key_left + key_right)
	if (vsp < 2)
		vsp += 0.1
	else
		vsp = 2
	if (move != 0)
		movespeed = Approach(movespeed, (move * 8), 0.5)
	else
		movespeed = Approach(movespeed, 0, 0.5)
	var _jump = 0
	if (balloonbuffer > 0)
		balloonbuffer--
	else
		_jump = 1
	if key_jump
		_jump = 1
	if _jump
	{
		create_particle(x, y, particle.ratmountballooncloud, 0)
		state = states.ratmountjump
		sprite_index = spr_player_ratmountballoonend1
		image_index = 0
		jumpAnim = 1
		vsp = -20
		jumpstop = 1
	}
	exit;
}

