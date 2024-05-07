if (!locked)
{
	image_speed = 0
	image_index = 0
	x = Approach(x, obj_player1.x, spd)
	y = Approach(y, obj_player1.y, spd)
	spd = Approach(spd, 30, 0.1)
	if distance_to_pos(x, y, obj_player1.x, obj_player1.y, 16, 16)
	{
		locked = 1
		alarm[0] = 60
	}
}
else
{
	x = obj_player1.x
	y = obj_player1.y
	image_speed = 0.35
}
with (trapID)
	image_angle = point_direction(x, y, other.x, other.y)
