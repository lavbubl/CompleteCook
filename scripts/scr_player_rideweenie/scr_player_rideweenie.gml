function scr_player_rideweenie()
{
	hsp = movespeed
	move = (key_right + key_left)
	if (move != 0)
	{
		if (move == xscale)
			movespeed = Approach(movespeed, (xscale * 16), 0.35)
		else
		{
			movespeed = Approach(movespeed, 0, 0.7)
			if (movespeed <= 0)
				xscale = move
		}
		if (abs(movespeed) < 3 && move != 0)
			image_speed = 0.35
		else if (abs(movespeed) > 3 && abs(movespeed) < 6)
			image_speed = 0.45
		else
			image_speed = 0.6
	}
	else
		movespeed = Approach(movespeed, 0, 0.7)
	if (grounded && (!(place_meeting(x, (y + 1), obj_bounceplank))))
	{
		if (!(place_meeting(x, (y + 1), obj_slope)))
			instance_create(x, y, obj_highjumpcloud2)
		vsp = -6
	}
	if key_jump
		input_buffer_jump = 0
	if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))) && (!(place_meeting((x + hsp), y, obj_ratblock))) && (!(place_meeting((x + hsp), y, obj_destructibles))))
	{
		movespeed = ((-movespeed) * 0.5)
		repeat (3)
		{
			with (create_debris(x, y, spr_slapstar))
			{
				hsp = random_range(-5, 5)
				vsp = random_range(-10, 10)
			}
		}
	}
	if key_jump
	{
		movespeed = abs(hsp)
		if (movespeed < 6)
			movespeed = 6
		dir = xscale
		state = states.mach2
		sprite_index = spr_mach2jump
		jumpstop = 0
		vsp = -11
		instance_create(x, y, obj_jumpdust)
		with (instance_create(x, y, obj_weeniemount))
			image_xscale = other.xscale
	}
	if ((!instance_exists(dashcloudid)) && grounded)
	{
		with (instance_create(x, y, obj_dashcloud))
		{
			image_xscale = other.xscale
			other.dashcloudid = id
		}
	}
	if (punch_afterimage > 0)
		punch_afterimage--
	else
	{
		punch_afterimage = 5
		create_blue_afterimage(x, y, sprite_index, image_index, xscale)
	}
	image_speed = 0.5
	exit;
}

