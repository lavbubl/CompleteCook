audio_master_gain(window_has_focus() || !global.unfocus_mute ? global.master_volume : 0)

gameframe_update()

if room == mainmenu && !gameframe_get_fullscreen() && !obj_menupeppino.painless && !instance_exists(obj_options)
	gameframe_set_window_cursor(cr_default)
