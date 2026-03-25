if sprite_index == spr_rankN_P_loose
	image_index = 2
else
{
	if sprite_index == spr_rankN_P_fall && image_speed != 0
	{
		shake_camera(2, 3 / room_speed)
		scr_sound(sfx_groundpound)
	}
	image_speed = 0
	image_index = image_number - 1
}
