scr_getinput()
if (updown_buffer > 0)
{
	updown_buffer--
	if ((!key_up2) && (!key_down2) && (!keyboard_check_pressed(vk_up)) && (!keyboard_check_pressed(vk_down)))
		updown_buffer = 0
}
else
{
	if ((key_up2 or keyboard_check_pressed(vk_up)) && audio_select > -1)
	{
		updown_buffer = updown_max
		audio_select -= 1
		scr_soundeffect(sfx_step)
	}
	if ((key_down2 or keyboard_check_pressed(vk_down)) && audio_select < 2)
	{
		updown_buffer = updown_max
		audio_select += 1
		scr_soundeffect(sfx_step)
	}
}
if (key_jump or keyboard_check_pressed(vk_return))
{
	switch audio_select
	{
		case -1:
			set_audio_config()
			obj_option.alarm[0] = 2
			instance_destroy()
			break
		default:
			set_audio_config()
			break
	}

}
var increment = (key_attack ? 10 : 1)
if (key_buffer > 0)
	key_buffer--
else
{
	if ((-key_left) or keyboard_check(vk_left))
	{
		switch audio_select
		{
			case 0:
				audiosaved_master -= increment
				break
			case 1:
				audiosaved_music -= increment
				break
			case 2:
				audiosaved_sfx -= increment
				break
		}

		key_buffer = key_max
	}
	if (key_right or keyboard_check(vk_right))
	{
		switch audio_select
		{
			case 0:
				audiosaved_master += increment
				break
			case 1:
				audiosaved_music += increment
				break
			case 2:
				audiosaved_sfx += increment
				break
		}

		key_buffer = key_max
	}
}
audiosaved_master = clamp(audiosaved_master, 0, 100)
audiosaved_music = clamp(audiosaved_music, 0, 100)
audiosaved_sfx = clamp(audiosaved_sfx, 0, 100)
