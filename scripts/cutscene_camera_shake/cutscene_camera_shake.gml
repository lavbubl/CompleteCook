function cutscene_camera_shake(argument0, argument1)
{
	with (obj_camera)
	{
		shake_mag = argument0
		shake_mag_acc = argument1
	}
	cutscene_end_action()
	exit;
}

