function make_pause_image()
{
	var surface = surface_create(screen_w, screen_h)
	
	surface_set_target(surface)
	
	draw_set_color(c_white)
	draw_rectangle(0, 0, screen_w, screen_h, false)
	
	gpu_set_alphatestenable(false)
	draw_surface(application_surface, 0, 0)
	gpu_set_alphatestenable(true)
	
	surface_reset_target()
	
	return sprite_create_from_surface(surface, 0, 0, screen_w, screen_h, false, false, 0, 0)
}