if state == 0
{
	if fade_alpha < 1
		fade_alpha += fade_spd
	else
	{
		state++
		alarm[0] = 190
		if music != noone
			scr_sound(music)
	}
}
else
	fade_alpha = max(fade_alpha - fade_spd, 0)
