if !surface_exists(gui_surf)
	gui_surf = surface_create(SCREEN_WIDTH, SCREEN_HEIGHT)

surface_set_target(gui_surf)
draw_clear_alpha(c_black, 0)
gpu_set_blendmode_normal_fixed()
