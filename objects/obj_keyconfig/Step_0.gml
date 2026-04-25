var _prev_input_type = global.input_type
global.input_type = INPUT_TYPE.KEYBOARD

if !binding
	selected = clamp(selected + (-input_check_pressed(INPUTS.ui_up) + input_check_pressed(INPUTS.ui_down)), -1, array_length(binds) - 1)

if selected == -1
{
	if input_check_pressed(INPUTS.ui_accept) || input_check_pressed(INPUTS.ui_deny)
		instance_destroy()
	exit;
}

var bindname = binds[selected].globalname

if binding 
{
	if keyboard_check_pressed(vk_anykey)
	{	
		if binds[selected].input == vk_nokey
			global.keybinds[$ bindname] = keyboard_key
		else
		{
			if is_real(global.keybinds[$ bindname])
				global.keybinds[$ bindname] = [global.keybinds[$ bindname]] //convert it to array
			else if is_string(global.keybinds[$ bindname])
				global.keybinds[$ bindname] = [ord(global.keybinds[$ bindname])]
			
			if !array_contains(global.keybinds[$ bindname], keyboard_key) //check if the key isnt set already
				array_push(global.keybinds[$ bindname], keyboard_key) //then add the key
		}
		
		binds[selected].input = global.keybinds[$ bindname]
		binding = false
	}
}
else
{
	if keyboard_check_pressed(ord("Z"))
		binding = true
	else if keyboard_check_pressed(ord("C"))
	{
		global.keybinds[$ bindname] = vk_nokey
		binds[selected].input = global.keybinds[$ bindname]
	}
	else if keyboard_check_pressed(vk_f1)
	{
		array_foreach(binds, function(_element) {
			_element.input = _element.defaultbind
			global.keybinds[$ _element.globalname] = _element.defaultbind
		})
	}
	if input_check_pressed(INPUTS.ui_deny)
		instance_destroy()
}

global.input_type = _prev_input_type
