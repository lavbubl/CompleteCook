function get_input()
{
	var keybinds = {
		left: vk_left,
		right: vk_right,
		up: vk_up,
		down: vk_down,
		jump: ord("Z"),
		grab: ord("X"),
		dash: vk_shift,
		taunt: ord("C")
	}
	
	key_left = setkey(keybinds.left)
	key_right = setkey(keybinds.right)	
	key_up = setkey(keybinds.up)
	key_down = setkey(keybinds.down)	
	key_jump = setkey(keybinds.jump)
	key_grab = setkey(keybinds.grab)
	key_dash = setkey(keybinds.dash)
	key_taunt = setkey(keybinds.taunt)
}

function setkey(keybind)
{
	var k = {
		down: keyboard_check(keybind),
		pressed: keyboard_check_pressed(keybind),
		released: keyboard_check_released(keybind)
	}
	return k
}