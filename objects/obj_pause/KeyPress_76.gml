global.mute_music = !global.mute_music

audio_group_set_gain(audiogroup_music, global.mute_music ? 0 : 1, 0)

ini_open("globalsave.ini")
ini_write_real("options", "mute_music", global.mute_music)
ini_close()
