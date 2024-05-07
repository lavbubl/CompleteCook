if (!audio_is_playing(obj_music_set.music_editor))
{
	audio_stop_all()
	scr_sound(obj_music_set.music_editor)
	pausedmusic = obj_music_set.music_editor
}
