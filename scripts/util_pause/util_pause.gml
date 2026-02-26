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

function do_unpause()
{
	pause = false
	optionselected = 0
	if audio_is_playing(mu_pause)
		audio_stop_sound(mu_pause)
	instance_activate_all()
	audio_resume_all()
	with obj_music
	{
		if (global.secret && secret_mu_to_play != noone)
			pauseIDS(true);
	}
	obj_player.pausestopframe = true
}
