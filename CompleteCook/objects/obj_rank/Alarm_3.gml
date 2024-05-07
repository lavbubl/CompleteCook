if (text_pos >= array_length(text))
	alarm[0] = 150
else
{
	with (obj_camera)
	{
		shake_mag = 2
		shake_mag_acc = 3 / room_speed
	}
	scr_soundeffect(sfx_killingblow)
	text[text_pos][0] = true
	text_pos++
	alarm[3] = 40
}
