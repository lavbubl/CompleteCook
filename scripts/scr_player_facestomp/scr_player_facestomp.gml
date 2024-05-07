function scr_player_facestomp()
{
	move = (key_left + key_right)
	jumpAnim = 0
	hsp = (move * movespeed)
	if ((scr_solid((x + 1), y) && xscale == 1) or (scr_solid((x - 1), y) && xscale == -1))
		movespeed = 0
	if (move == 0)
		movespeed = 0
	if (move != 0 && movespeed < 6)
		movespeed += 0.5
	if (xscale == 1 && move == -1)
		movespeed = 0
	if (xscale == -1 && move == 1)
		movespeed = 0
	if (!key_down)
		state = states.jump
	landAnim = 1
	if (vsp > 0)
		superslam++
	else
		superslam = 0
	if (vsp > 15)
	{
		state = states.freefall
		superslam = 0
	}
	if (grounded && ((!(place_meeting(x, (y + 1), obj_destructibles))) or place_meeting(x, (y + 1), obj_metalblock)) && vsp > 0)
	{
		state = states.freefallland
		jumpAnim = 1
		jumpstop = 0
		image_index = 0
		create_particle(x, y, particle.landcloud, 0)
		freefallstart = 0
	}
	if (facestompAnim == 0)
		sprite_index = spr_player_facestomp
	else if (facestompAnim == 1)
	{
		sprite_index = spr_player_facestomphit
		if (floor(image_index) == 5)
			facestompAnim = 0
	}
	if (move != 0)
		xscale = move
	image_speed = 0.35
	if (grounded && input_buffer_jump < 8 && vsp > 0)
	{
		sprite_index = spr_player_hanstandjump
		stompAnim = 0
		hsp = 0
		state = states.handstandjump
		jumpAnim = 1
		jumpstop = 0
		image_index = 0
		create_particle(x, y, particle.landcloud, 0)
		freefallstart = 0
	}
	if key_jump
		input_buffer_jump = 0
	exit;
}

