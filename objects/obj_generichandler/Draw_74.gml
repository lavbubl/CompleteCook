if !surface_exists(gui_surf)
	gui_surf = surface_create(screen_w, screen_h)

gpu_set_blendmode(bm_normal)
gpu_set_blendequation_sepalpha(bm_eq_add, bm_eq_max)
surface_set_target(gui_surf)
draw_clear_alpha(c_black, 0)
