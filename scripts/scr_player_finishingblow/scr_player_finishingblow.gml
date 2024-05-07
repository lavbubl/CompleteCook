function scr_player_finishingblow()
{
	hsp = movespeed
	movespeed = Approach(movespeed, 0, 0.25)
	if (floor(image_index) == (image_number - 1))
	{
		movespeed = abs(movespeed)
		state = states.normal
	}
	image_speed = 0.4
	landAnim = 0
	if ((!instance_exists(obj_dashcloud2)) && grounded && movespeed > 3)
	{
		with (instance_create(x, y, obj_dashcloud2))
			image_xscale = other.xscale
	}
	if (punch_afterimage > 0)
		punch_afterimage--
	else
	{
		punch_afterimage = 5
		create_blue_afterimage(x, y, sprite_index, image_index, xscale)
	}
	exit;
}

