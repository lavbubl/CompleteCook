function get_input()
{
	gamepad_set_colour(0, c_red);
	show_debug_message(gamepad_is_connected(1))
	if (!gamepad_is_connected(0)) {
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
	if (!gamepad_is_connected(0)) {
		var k = {
			down: keyboard_check(keybind),
			pressed: keyboard_check_pressed(keybind),
			released: keyboard_check_released(keybind),
		}
	}
	else {
		var k = {
			down: gamepad_button_check(0, keybind),
			pressed: gamepad_button_check_pressed(0, keybind),
			released: gamepad_button_check_released(0, keybind),
		}
	}
	return k
}