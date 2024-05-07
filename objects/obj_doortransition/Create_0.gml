audio_sound_gain(sfx_door, 0.7, 0)
if (!audio_is_playing(sfx_door))
	audio_play_sound(sfx_door, 1, false)
