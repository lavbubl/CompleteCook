if launch
{
	if rotate
	{
		image_angle = angle_rotate(image_angle, point_direction(x, y, obj_player1.x, obj_player1.y), 4)
		if (alarm[1] == -1)
			alarm[1] = 100
	}
	var spd = 6
	x += lengthdir_x(spd, image_angle)
	y += lengthdir_y(spd, image_angle)
}
