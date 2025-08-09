surface_reset_target()

var ratio = window_get_width() / window_get_height()

if ratio != screen_w / screen_h
	draw_sprite_tiled(lb_sprs[lb_pos], 0, screen_w / 2, screen_h / 2)

gpu_set_blendmode_normal_fixed()
draw_reset_color()
draw_rectangle(-1, -1, screen_w, screen_h, false)

var screen_x = 0
var screen_y = 0

draw_surface(application_surface, screen_x, screen_y) //here for no reason now, but maybe someone wants to use shaders

shader_set(shd_gui_brighten)
draw_surface(gui_surf, screen_x, screen_y)
shader_reset()

gpu_set_blendmode_normal_fixed()

draw_set_font(fnt_caption)
gameframe_draw()
