if state == 0
{
	if fade_alpha < 1
		fade_alpha += fade_spd
	else
	{
		state++
		alarm[0] = 190
		if music != noone
			fmod_studio_event_instance_oneshot(music)
	}
}
else
	fade_alpha = max(fade_alpha - fade_spd, 0)
