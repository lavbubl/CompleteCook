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
		taunt: ord("C"),
		ui_left: vk_left,
		ui_right: vk_right,
		ui_up: vk_up,
		ui_down: vk_down,
		ui_accept: [vk_enter, vk_space, ord("Z")],
		ui_deny: [vk_backspace, vk_escape, ord("X")]
	}
	
	key_left = setkey(keybinds.left)
	key_right = setkey(keybinds.right)	
	key_up = setkey(keybinds.up)
	key_down = setkey(keybinds.down)	
	key_jump = setkey(keybinds.jump)
	key_grab = setkey(keybinds.grab)
	key_dash = setkey(keybinds.dash)
	key_taunt = setkey(keybinds.taunt)
	
	uikey_left = setkey(keybinds.ui_left)
	uikey_right = setkey(keybinds.ui_right)
	uikey_up = setkey(keybinds.ui_up)
	uikey_down = setkey(keybinds.ui_down)
	uikey_accept = setkey(keybinds.ui_accept)
	uikey_deny = setkey(keybinds.ui_deny)
}

function setkey(keybind)
{
	var k = {
		down: false,
		pressed: false,
		released: false
	}
	
	if is_array(keybind)
	{
		for (var i = 0; i < array_length(keybind); i++) {
			var noneedtocheck = false
			if keyboard_check(keybind[i])
			{
				k.down = true
				noneedtocheck = true
			}
			if keyboard_check_pressed(keybind[i])
				k.pressed = true
			if keyboard_check_released(keybind[i])
				k.released = true
			
			if noneedtocheck
				break;
		}
	}
	else
	{
		k = {
			down: keyboard_check(keybind),
			pressed: keyboard_check_pressed(keybind),
			released: keyboard_check_released(keybind)
		}
	}
	return k
}