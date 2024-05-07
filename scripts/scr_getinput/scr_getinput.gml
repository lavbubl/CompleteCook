function scr_getinput()
{
	if (instance_exists(obj_debugcontroller) && obj_debugcontroller.active)
		exit;
	
	var _dvc = obj_inputAssigner.player_input_device[0]
	
	gamepad_set_axis_deadzone(_dvc, 0.4)
	key_up = (keyboard_check(global.key_up) or gamepad_button_check(_dvc, global.key_upC) or gamepad_axis_value(_dvc, gp_axislv) < 0)
	key_up2 = (keyboard_check_pressed(global.key_up) or gamepad_button_check_pressed(_dvc, global.key_upC) or (gamepad_axis_value(_dvc, gp_axislv) < -0.5 && stickpressed == 0))
	key_right = (keyboard_check(global.key_right) or gamepad_button_check(_dvc, global.key_rightC) or gamepad_axis_value(_dvc, gp_axislh) > 0)
	key_right2 = (keyboard_check_pressed(global.key_right) or gamepad_button_check_pressed(_dvc, global.key_rightC) or (gamepad_axis_value(_dvc, gp_axislh) > 0.5 && stickpressed == 0))
	key_left = (-((keyboard_check(global.key_left) or gamepad_button_check(_dvc, global.key_leftC) or gamepad_axis_value(_dvc, gp_axislh) < 0)))
	key_left2 = (-((keyboard_check_pressed(global.key_left) or gamepad_button_check_pressed(_dvc, global.key_leftC) or (gamepad_axis_value(_dvc, gp_axislh) < -0.5 && stickpressed == 0))))
	key_down = (keyboard_check(global.key_down) or gamepad_button_check(_dvc, global.key_downC) or gamepad_axis_value(_dvc, gp_axislv) > 0)
	key_down2 = (keyboard_check_pressed(global.key_down) or gamepad_button_check_pressed(_dvc, global.key_downC) or (gamepad_axis_value(_dvc, gp_axislv) > 0.5 && stickpressed == 0))
	key_jump = (keyboard_check_pressed(global.key_jump) or gamepad_button_check_pressed(_dvc, global.key_jumpC))
	key_jump2 = (keyboard_check(global.key_jump) or gamepad_button_check(_dvc, global.key_jumpC))
	key_slap = (keyboard_check(global.key_slap) or gamepad_button_check(_dvc, global.key_slapC))
	key_slap2 = (keyboard_check_pressed(global.key_slap) or gamepad_button_check_pressed(_dvc, global.key_slapC))
	key_taunt = (keyboard_check(global.key_taunt) or gamepad_button_check(_dvc, global.key_tauntC))
	key_taunt2 = (keyboard_check_pressed(global.key_taunt) or gamepad_button_check_pressed(_dvc, global.key_tauntC))
	key_attack = (keyboard_check(global.key_attack) or gamepad_button_check(_dvc, global.key_attackC) or gamepad_button_check(_dvc, gp_shoulderrb))
	key_attack2 = (keyboard_check_pressed(global.key_attack) or gamepad_button_check_pressed(_dvc, global.key_attackC) or gamepad_button_check_pressed(_dvc, gp_shoulderrb))
	key_shoot = (keyboard_check(global.key_shoot) or gamepad_button_check(_dvc, global.key_shootC))
	key_shoot2 = (keyboard_check_pressed(global.key_shoot) or gamepad_button_check_pressed(_dvc, global.key_shootC))
	key_start = (keyboard_check_pressed(global.key_start) or gamepad_button_check_pressed(_dvc, global.key_startC))
	key_escape = (keyboard_check_pressed(vk_escape) or gamepad_button_check(_dvc, gp_select))
	key_chainsaw = (keyboard_check(global.key_chainsaw) or gamepad_button_check(_dvc, global.key_chainsawC) or gamepad_button_check(_dvc, gp_shoulderlb))
	key_chainsaw2 = (keyboard_check_pressed(global.key_chainsaw) or gamepad_button_check_pressed(_dvc, global.key_chainsawC) or gamepad_button_check_pressed(_dvc, gp_shoulderlb))
	
	if (gamepad_axis_value(_dvc, gp_axislh) > 0.5 or gamepad_axis_value(_dvc, gp_axislh) < -0.5 or gamepad_axis_value(_dvc, gp_axislv) > 0.5 or gamepad_axis_value(_dvc, gp_axislv) < -0.5)
		stickpressed = true
	else
		stickpressed = false
	
	if (object_index == obj_player1 && state == states.Sjumpprep)
	{
		var haxis = gamepad_axis_value(_dvc, gp_axislh)
		var vaxis = gamepad_axis_value(_dvc, gp_axislv)
		if (haxis != 0 or vaxis != 0)
		{
			var _dir = point_direction(0, 0, haxis, vaxis)
			trace(_dir)
			var _deadzone = 5
			if (_dir >= _deadzone && _dir <= (180 - _deadzone))
				key_up = true
		}
	}
}
