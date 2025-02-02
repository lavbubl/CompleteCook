function get_input()
{
	if (!gamepad_is_connected(global.maingamepad)) {
		var keybinds = {
			left: vk_left,
			right: vk_right,
			up: vk_up,
			down: vk_down,
			jump: ord("Z"),
			attack: ord("X"),
			dash: vk_shift,
			taunt: ord("C")
		}
	}
	else {
		gamepad_set_color(global.maingamepad, c_red)
		var keybinds = {
			left: gp_padl,
			right: gp_padr,
			up: gp_padu,
			down: gp_padd,
			jump: gp_face1,
			attack: gp_face3,
			dash: gp_shoulderrb,
			taunt: gp_face4
		}
	}
	key_left = setkey(keybinds.left)
	key_right = setkey(keybinds.right)	
	key_up = setkey(keybinds.up)
	key_down = setkey(keybinds.down)	
	key_jump = setkey(keybinds.jump)
	key_attack = setkey(keybinds.attack)
	key_dash = setkey(keybinds.dash)
	key_taunt = setkey(keybinds.taunt)
}

function setkey(keybind)
{
	if (!gamepad_is_connected(global.maingamepad)) {
		var k = {
			down: keyboard_check(keybind),
			pressed: keyboard_check_pressed(keybind),
			released: keyboard_check_released(keybind),
		}
	}
	else {
		var k = {
			down: gamepad_button_check(global.maingamepad, keybind),
			pressed: gamepad_button_check_pressed(global.maingamepad, keybind),
			released: gamepad_button_check_released(global.maingamepad, keybind),
		}
	}
	return k
}