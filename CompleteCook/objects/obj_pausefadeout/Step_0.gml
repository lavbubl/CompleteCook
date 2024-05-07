if (fadealpha > 1 && (!fadein))
{
	if obj_pause.pause
	{
		instance_activate_all()
		scr_deactivate_escape()
		alarm[0] = 1
		audio_resume_all()
	}
	else if (!obj_pause.pause)
	{
		obj_pause.appsprite = sprite_create_from_surface(application_surface, 0, 0, 960, 540, 0, 0, 0, 0)
		audio_pause_all()
		scr_music(mu_pause)
		audio_sound_gain(mu_pause, 0, 0)
		audio_sound_gain(mu_pause, global.option_music_volume * 0.8, 500)
		instance_deactivate_all(true)
		instance_activate_object(obj_pause)
		instance_activate_object(obj_inputAssigner)
	}
	obj_pause.pause = (!obj_pause.pause)
	fadein = 1
}
fadealpha += ((!fadein) ? 1 : -1)
if (fadein && fadealpha < 0)
	instance_destroy()
