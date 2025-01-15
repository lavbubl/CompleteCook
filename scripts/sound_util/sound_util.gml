function scr_sound(snd, loop = false)
{
	var g = 1 //global.sfx_volume
	var played_snd = audio_play_sound(snd, 1, loop, g)
	
	return played_snd;
}

function scr_sound_pitched(snd, pitch_start = 0.95, pitch_end = 1.05)
{
	var g = 1 //global.sfx_volume
	var played_snd = audio_play_sound(snd, 1, 0, g)
	audio_sound_pitch(snd, random_range(pitch_start, pitch_end))
	
	return played_snd;
}
