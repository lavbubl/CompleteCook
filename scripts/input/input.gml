function get_input()
{
	var keybinds = {
		left: vk_left,
		right: vk_right,
		up: vk_up,
		down: vk_down,
		jump: ord("Z"),
		attack: ord("X"),
		dash: vk_shift
	}
	
	key_left = setkey(keybinds.left)
	key_right = setkey(keybinds.right)	
	key_up = setkey(keybinds.up)
	key_down = setkey(keybinds.down)	
	key_jump = setkey(keybinds.jump)
	key_attack = setkey(keybinds.attack)
	key_dash = setkey(keybinds.dash)
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