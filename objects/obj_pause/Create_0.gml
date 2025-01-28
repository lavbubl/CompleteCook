create_image = false
pause = false
pause_image = spr_null
ini_open("globalsave.ini")
global.fullscreen = ini_read_real("options", "fullscreen", false)
global.mute_all = ini_read_real("options", "mute_all", false)
ini_close()

window_set_fullscreen(global.fullscreen)
audio_group_set_gain(audiogroup_default, global.mute_all ? 0 : 1, 0)
