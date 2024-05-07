if (!deactivated)
{
	if ((!device_selected[0]) && instance_exists(obj_pause) && obj_pause.pause == 0)
	{
		for (var i = 0; i < 8; i++)
		{
			var _index = scr_anybutton_pressed(i)
			if (_index >= 0)
			{
				device_selected[0] = 1
				player_input_device[0] = _index
				press_start = 0
			}
		}
	}
	i = 0
	while (i < 2)
	{
		if (device_selected[i] && player_input_device[i] >= 0)
		{
			if (!gamepad_is_connected(player_input_device[i]))
			{
				deactivated = 1
				device_selected[i] = 0
				player_input_device[i] = -2
				device_to_reconnect = i
				instance_deactivate_all(true)
				break
			}
			else
			{
				i++
				continue
			}
		}
		else
		{
			i++
			continue
		}
	}
}
else
{
	for (i = 0; i < 8; i++)
	{
		_index = scr_button_pressed(i)
		if (_index != -2)
		{
			if ((!CheckUsedIndex(_index)) or (device_to_reconnect == 1 && _index == -1 && (keyboard_check_pressed(global.key_jumpN) or keyboard_check_pressed(global.key_startN))))
			{
				device_selected[device_to_reconnect] = 1
				player_input_device[device_to_reconnect] = _index
				deactivated = 0
				instance_activate_all()
				scr_deactivate_escape()
				alarm[0] = 1
			}
			else if (device_to_reconnect == 1 && global.coop)
			{
				global.coop = false
				instance_destroy(obj_coopplayerfollow)
				device_selected[device_to_reconnect] = 0
				player_input_device[device_to_reconnect] = -2
				deactivated = 0
				instance_activate_all()
				scr_deactivate_escape()
				alarm[0] = 1
			}
		}
	}
}
