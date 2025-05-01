surface_reset_target()

var ratio = window_get_width() / window_get_height()

if ratio != screen_w / screen_h
	draw_sprite_tiled(lb_sprs[lb_pos], 0, 0, 0)

gpu_set_blendequation_sepalpha(bm_eq_add, bm_eq_max)
draw_surface(application_surface, 0, 0) //here for no reason now, but maybe someone wants to use shaders
draw_surface(gui_surf, 0, 0)
if letterbox && !window_get_fullscreen()
{
	var xo = (window_get_width() - screen_w) / 2
	var yo = (window_get_height() - screen_h) / 2
	display_set_gui_maximise(1, 1, xo, yo)
}
gpu_set_blendmode(bm_normal)
