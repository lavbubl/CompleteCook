if surface_exists(circ_surf) && instance_exists(target_obj)
{
	surface_set_target(circ_surf)

	draw_clear_alpha(c_black, 0.5)

	gpu_set_blendmode(bm_subtract)
	draw_set_color(c_white)
	draw_circle(target_obj.x, target_obj.y, circ_size, false)

	gpu_set_blendmode_normal_fixed()

	surface_reset_target()
	draw_surface(circ_surf, 0, 0)
}
