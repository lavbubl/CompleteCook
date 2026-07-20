var abletoinput = !instance_exists(obj_options) && !instance_exists(obj_quitgame) && !instance_exists(obj_deletesave) && state == 0 && buffer <= 0

if menu_dark
{
	if (keyboard_check_pressed(vk_anykey) || gamepad_check_pressed_any(global.pad_device)) && dark_state == 0
	{
		fmod_studio_event_instance_oneshot("event:/sfx/misc/menulight")
		alarm[1] = 80
		alarm[2] = 50
		fmod_studio_event_instance_set_parameter_by_name(mu, "lightson", true)
		dark_state = 1
	}
	exit;
}

if state == 0 && abletoinput
	cur_selected = clamp(cur_selected + (-input_direction_check_pressed(INPUTS.ui_left) + input_direction_check_pressed(INPUTS.ui_right)), 1, array_length(tvs))

obj_menupeppino.cur_selected = self.cur_selected

optionsalpha = approach(optionsalpha, 1, 0.1)

if abletoinput
{
	obj_menupeppino.painless = false
	if input_check_pressed(INPUTS.ui_start)
	{
		instance_create(0, 0, obj_options)
		abletoinput = false
	}
	else if input_check_pressed(INPUTS.ui_quit)
	{
		instance_create(0, 0, obj_quitgame)
		abletoinput = false
	}
	else if input_check_pressed(INPUTS.ui_delete) && tvs[cur_selected - 1].save_exists
	{
		instance_create(0, 0, obj_deletesave)
		abletoinput = false
	}
}
else
{
	obj_menupeppino.painless = true
	buffer--
}

for (var i = 0; i < array_length(tvs); i++) 
{
	var cur_tv = tvs[i]
	
	if cur_selected - 1 == i
	{
		with cur_tv
		{
			global.savefile = filename
			
			obj_menupeppino.p_ix = pal_ix
			obj_menupeppino.p_spr = pat_spr
			
			obj_player.pal_select = pal_ix
			obj_player.pattern_spr = pat_spr
			
			switch state
			{
				case 0:
					state++
					buffer = 25
					image_index = 0
					sprite_index = sprs.whitenoise
					fmod_studio_event_instance_set_volume(other.static_snd, 1)
					fmod_studio_event_instance_oneshot("event:/sfx/misc/ui_step")
					break;
				case 1:
					var _image_number = sprite_get_number(sprite_index)
					if save_exists
					{
						if (floor(image_index) == _image_number - 1)
						{
							state++
							reset_anim(sprs.selected)
							fmod_studio_event_instance_set_volume(other.static_snd, 0)
						}
					}
					else if (floor(image_index) == _image_number - 1)
						image_index = 2
					break;
			}
			if input_check_pressed(INPUTS.ui_confirm) && other.state == 0 && abletoinput
			{
				reset_anim(sprs.confirm)
				fmod_studio_event_instance_oneshot("event:/sfx/misc/fileselect")
				fmod_studio_event_instance_stop(other.mu, FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT)
				fmod_studio_event_instance_stop(other.static_snd, FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT)
				global.savefile = filename
				state = 2
				
				with obj_menupeppino
				{
					switch cur_selected
					{
						case 1:
							sprite_icombondex = spr_titlepep_left
							break;
						case 2:
							sprite_index = spr_titlepep_middle
							break;
						case 3:
							sprite_index = spr_titlepep_right
							break;
					}
					cur_anim_num = cur_selected
					alarm[0] = -1
				}
				
				with other
				{
					state = 1
					alarm[0] = 240
				}
			}
		}
	}
	else
	{
		cur_tv.state = 0
		cur_tv.sprite_index = cur_tv.sprs.off
	}
}
