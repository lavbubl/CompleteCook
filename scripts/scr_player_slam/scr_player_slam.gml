function scr_player_slam()
{
	if (windingAnim < 200)
		windingAnim += 5
	move = (key_left + key_right)
	if (!grounded)
		hsp = (move * movespeed)
	if ((scr_solid((x + 1), y) && xscale == 1) or (scr_solid((x - 1), y) && xscale == -1))
		movespeed = 0
	if (move == 0)
		movespeed = 0
	if (move != 0 && movespeed < 4)
		movespeed += 0.5
	if (xscale == 1 && move == -1)
		movespeed = 0
	if (xscale == -1 && move == 1)
		movespeed = 0
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	machslideAnim = 1
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 1
	if (floor(image_index) == 8)
		state = states.normal
	if (move != 0)
		xscale = move
	if (floor(image_index) == 3 && (!grounded))
		image_speed = 0
	else if (grounded && slamming == 0 && vsp > 0)
	{
		slamming = 1
		hsp = 0
		image_speed = 0.35
		with (obj_camera)
		{
			shake_mag = 10
			shake_mag_acc = (30 / room_speed)
		}
		with (obj_baddie)
		{
			if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
			{
				vsp = -7
				hsp = 0
			}
		}
	}
	sprite_index = spr_player_slam
	exit;
}

