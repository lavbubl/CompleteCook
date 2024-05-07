function scr_getinput2()
{
	if (instance_exists(obj_debugcontroller) && obj_debugcontroller.active)
		exit;
	var _dvc = obj_inputAssigner.player_input_device[1]
	gamepad_set_axis_deadzone(_dvc, 0.4)
	key_up = (keyboard_check(global.key_upN) or gamepad_button_check(_dvc, global.key_upCN) or gamepad_axis_value(_dvc, gp_axislv) < 0)
	key_up2 = (keyboard_check_pressed(global.key_upN) or gamepad_button_check_pressed(_dvc, global.key_upCN) or (gamepad_axis_value(_dvc, gp_axislv) < -0.5 && stickpressed == 0))
	key_right = (keyboard_check(global.key_rightN) or gamepad_button_check(_dvc, global.key_rightCN) or gamepad_axis_value(_dvc, gp_axislh) > 0)
	key_right2 = (keyboard_check_pressed(global.key_rightN) or gamepad_button_check_pressed(_dvc, global.key_rightCN) or (gamepad_axis_value(_dvc, gp_axislh) > 0.5 && stickpressed == 0))
	key_left = (-((keyboard_check(global.key_leftN) or gamepad_button_check(_dvc, global.key_leftCN) or gamepad_axis_value(_dvc, gp_axislh) < 0)))
	key_left2 = (-((keyboard_check_pressed(global.key_leftN) or gamepad_button_check_pressed(_dvc, global.key_leftCN) or (gamepad_axis_value(_dvc, gp_axislh) < -0.5 && stickpressed == 0))))
	key_down = (keyboard_check(global.key_downN) or gamepad_button_check(_dvc, global.key_downCN) or gamepad_axis_value(_dvc, gp_axislv) > 0)
	key_down2 = (keyboard_check_pressed(global.key_downN) or gamepad_button_check_pressed(_dvc, global.key_downCN) or (gamepad_axis_value(_dvc, gp_axislv) > 0.5 && stickpressed == 0))
	key_jump = (keyboard_check_pressed(global.key_jumpN) or gamepad_button_check_pressed(_dvc, global.key_jumpCN))
	key_jump2 = (keyboard_check(global.key_jumpN) or gamepad_button_check(_dvc, global.key_jumpCN))
	key_slap = (keyboard_check(global.key_slapN) or gamepad_button_check(_dvc, global.key_slapCN))
	key_slap2 = (keyboard_check_pressed(global.key_slapN) or gamepad_button_check_pressed(_dvc, global.key_slapCN))
	key_taunt = (keyboard_check(global.key_tauntN) or gamepad_button_check(_dvc, global.key_tauntCN))
	key_taunt2 = (keyboard_check_pressed(global.key_tauntN) or gamepad_button_check_pressed(_dvc, global.key_tauntCN))
	key_attack = (keyboard_check(global.key_attackN) or gamepad_button_check(_dvc, global.key_attackCN) or gamepad_button_check(_dvc, gp_shoulderrb))
	key_attack2 = (keyboard_check_pressed(global.key_attackN) or gamepad_button_check_pressed(_dvc, global.key_attackCN) or gamepad_button_check_pressed(_dvc, gp_shoulderrb))
	key_shoot = (keyboard_check(global.key_shootN) or gamepad_button_check(_dvc, global.key_shootCN))
	key_shoot2 = (keyboard_check_pressed(global.key_shootN) or gamepad_button_check_pressed(_dvc, global.key_shootCN))
	key_start = (keyboard_check_pressed(global.key_startN) or gamepad_button_check_pressed(_dvc, global.key_startCN))
	key_escape = (keyboard_check_pressed(vk_escape) or gamepad_button_check(_dvc, gp_select))
	key_chainsaw = (keyboard_check(global.key_chainsawN) or gamepad_button_check(_dvc, global.key_chainsawCN) or gamepad_button_check(_dvc, gp_shoulderlb))
	key_chainsaw2 = (keyboard_check_pressed(global.key_chainsawN) or gamepad_button_check_pressed(_dvc, global.key_chainsawCN) or gamepad_button_check_pressed(_dvc, gp_shoulderlb))
	if (object_index == obj_player2 && state == states.Sjumpprep)
	{
		var haxis = gamepad_axis_value(_dvc, gp_axislh)
		var vaxis = gamepad_axis_value(_dvc, gp_axislv)
		if (haxis != 0 or vaxis != 0)
		{
			var _dir = point_direction(0, 0, haxis, vaxis)
			trace(_dir)
			var _deadzone = 5
			if (_dir >= _deadzone && _dir <= (180 - _deadzone))
				key_up = 1
		}
	}
	if (gamepad_axis_value(_dvc, gp_axislh) > 0.5 or gamepad_axis_value(_dvc, gp_axislh) < -0.5 or gamepad_axis_value(_dvc, gp_axislv) > 0.5 or gamepad_axis_value(_dvc, gp_axislv) < -0.5)
		stickpressed = 1
	else
		stickpressed = 0
	exit;
}

