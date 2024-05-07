function scr_button_pressed(argument0)
{
	if (keyboard_check_pressed(vk_return) or keyboard_check_pressed(global.key_jump) or keyboard_check_pressed(global.key_jumpN))
		return -1;
	else if gamepad_is_connected(argument0)
	{
		if (gamepad_button_check(argument0, gp_face1) or gamepad_button_check(argument0, gp_start))
			return argument0;
	}
	return -2;
}

