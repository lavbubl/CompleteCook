if input_direction_check_pressed(INPUTS.ui_left) || input_direction_check_pressed(INPUTS.ui_right)
{
	quit = !quit
	fmod_studio_system_get_event("event:/sfx/misc/ui_step")
}

if (input_check_pressed(INPUTS.ui_confirm) && !quit) || input_check_pressed(INPUTS.ui_quit)
	instance_destroy()
else if input_check(INPUTS.ui_confirm) && quit
{
	quit_timer++
	if fmod_studio_event_instance_get_playback_state(bomb_snd) != FMOD_STUDIO_PLAYBACK_STATE.PLAYING
		fmod_studio_event_instance_start(bomb_snd)
	sprite_index = spr_menubomb_flash
	image_speed = 0.25
}
else
{
	quit_timer = 0
	fmod_studio_event_instance_stop(bomb_snd, FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT)
	sprite_index = spr_menubomb
	image_speed = 0.1
}

if quit_timer >= 120
{
	with obj_menuhandler
	{
		with tvs[cur_selected - 1]
		{
			sprite_index = sprs.whitenoise
			save_exists = false
			pal_ix = 1
			pat_spr = pat_pizza
			state = 1
		}
		fmod_studio_event_instance_set_volume(static_snd, 1)
	}
	
	file_delete(global.savestring)
	shake_camera(20, 40 / room_speed)
	fmod_studio_event_instance_oneshot("event:/sfx/misc/menu/delete")
	
	instance_destroy()
}