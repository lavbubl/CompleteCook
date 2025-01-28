global.mute_all = !global.mute_all

audio_group_set_gain(audiogroup_default, global.mute_all ? 1 : 0, 0)

ini_open("globalsave.ini")
ini_write_real("options", "mute_game", global.mute_all)
ini_close()
