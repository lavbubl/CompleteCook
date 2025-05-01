function make_pause_image()
{
	var surface = surface_create(screen_w, screen_h)
	
	surface_set_target(surface)
	
	draw_reset_color()
	draw_clear(c_black)
	
	draw_surface(application_surface, 0, 0)
	
	draw_surface(obj_screensizer.gui_surf, 0, 0)
	
	surface_reset_target()
	
	var s = sprite_create_from_surface(surface, 0, 0, screen_w, screen_h, false, false, 0, 0)
	
	surface_free(surface)
	
	return s;
}