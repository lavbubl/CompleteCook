if !surface_exists(gui_surf)
	gui_surf = surface_create(screen_w, screen_h)

surface_set_target(gui_surf)
draw_clear_alpha(c_black, 0)
gpu_set_blendmode_normal_fixed()
