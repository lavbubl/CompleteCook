function cutscene_medieval_middle()
{
	var _finish = 0
	with (obj_knightplatform)
	{
		y = Approach(y, y_to, 5)
		if (y == y_to)
			_finish = 1
	}
	with (obj_camera)
	{
		shake_mag = 5
		shake_mag_acc = (10 / room_speed)
	}
	if _finish
		cutscene_end_action()
	exit;
}

