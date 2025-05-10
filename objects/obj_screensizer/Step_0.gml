audio_master_gain(window_has_focus() ? global.master_volume : 0)

var mouse_has_moved = window_mouse_get_delta_x() + window_mouse_get_delta_y() != 0

if gameframe_mouse_in_window() && mouse_has_moved
	gameframe_alpha_timer = 200
else if gameframe_alpha_timer > 0
	gameframe_alpha_timer--
	
window_set_cursor(gameframe_alpha_timer <= 0 ? cr_none : window_get_cursor())

gameframe_alpha = approach(gameframe_alpha, gameframe_alpha_timer > 0 ? 1 : 0, 0.05)
gameframe_update()
