if (!global.panic)
{
	var i = 0
	while (i < array_length(room_arr))
	{
		var b = room_arr[i]
		if (room == b[0])
		{
			var prevmusic = music
			music = b[1]
			secretmusic = b[2]
			if (music != prevmusic)
			{
				prevmuID = musicID
				musicID = scr_music(music)
				if b[3]
				{
					audio_sound_set_track_position(musicID, audio_sound_get_track_position(prevmuID))
					audio_sound_gain(prevmuID, 0, 4000)
					var sndgain = (audio_sound_get_gain(musicID) * 0.8) * global.option_music_volume
					audio_sound_gain(musicID, 0, 0)
					audio_sound_gain(musicID, sndgain, 2000)
				}
				else
					audio_stop_sound(prevmuID)
			}
			audio_stop_sound(secretmusicID)
			audio_stop_sound(pillarmusicID)
			secretmusicID = -4
			break
		}
		else
		{
			i++
			continue
		}
	}
	if (instance_exists(obj_hungrypillar) && !audio_is_playing(mu_dungeondepth))
	{
		pillarmusicID = scr_music(mu_dungeondepth)
		audio_sound_gain(pillarmusicID, 0, 0)
	}
}
if secret
{
	secretmusicID = scr_music(secretmusic)
	audio_sound_set_track_position(secretmusicID, wrap(audio_sound_get_track_position(musicID), 0, audio_sound_length(secretmusic) - 1))
	audio_pause_sound(musicID)
}
else if secretend
{
	secretend = 0
	audio_resume_sound(musicID)
	audio_stop_sound(secretmusicID)
}
if (room == rank_room)
{
	audio_stop_sound(musicID)
	audio_stop_sound(secretmusicID)
	audio_stop_sound(pillarmusicID)
	musicID = -4
	secretmusicID = -4
	pillarmusicID = -4
}

