if instance_exists(obj_shell)
{
	if obj_shell.isOpen
		exit;
}

if instance_exists(obj_keyconfig)
{
	inputbuffer = 2
	exit;
}

if room == mainmenu
	exit;

if (keyboard_check_pressed(vk_escape))
{
	if !pause
	{
		pause = true
		pause_image = make_pause_image()
		instance_deactivate_all(true)
		instance_activate_object(obj_screensizer)
		audio_pause_all()
		var mu = scr_sound(mu_pause, true)
		audio_sound_gain(mu, 0, 0)
		audio_sound_gain(mu, 1, 1000)
	}
	else
	{
		audio_stop_sound(mu_pause)
		pause = false
		instance_activate_all()
		audio_resume_all()
		
		with obj_music
		{
			if (global.secret && secret_mu_to_play != noone)
				pauseIDS(true);
		}
	}
}
