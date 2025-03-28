surface_reset_target()

gpu_set_blendequation_sepalpha(bm_eq_add, bm_eq_max)
draw_surface_ext(application_surface, 0, 0, 1, 1, 0, c_white, 1) //here for no reason now, but maybe someone wants to use shaders
draw_surface(gui_surf, 0, 0)
gpu_set_blendmode(bm_normal)
