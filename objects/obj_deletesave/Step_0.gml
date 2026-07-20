if input_direction_check_pressed(INPUTS.ui_left) || input_direction_check_pressed(INPUTS.ui_right)
{
	quit = !quit
	scr_sound(sfx_step)
}

if (input_check_pressed(INPUTS.ui_confirm) && !quit) || input_check_pressed(INPUTS.ui_quit)
	instance_destroy()
else if input_check(INPUTS.ui_confirm) && quit
{
	quit_timer++
	audio_sound_gain(bomb_snd, 1)
	sprite_index = spr_menubomb_flash
	image_speed = 0.25
}
else
{
	quit_timer = 0
	audio_sound_gain(bomb_snd, 0)
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
		audio_sound_gain(static_snd, 1, 0)
	}
	
	file_delete(global.savestring)
	shake_camera(20, 40 / room_speed)
	scr_sound(sfx_explosion)
	scr_sound(sfx_ui_savedeleted)
	
	instance_destroy()
}