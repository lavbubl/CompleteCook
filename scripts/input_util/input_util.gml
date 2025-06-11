/*

	Quick usage tutorial:
	
	in the create event, construct the Input object like this:
	key_up = new Input(global.keybinds.up);
	
	if you want it to update with global.keybinds, run:
	key_up.update(global.keybinds.up);
	
	the array can store multiple input keys, controller support is not implemented as of now.
	
*/

enum INPUT_TYPE
{
	KEYBOARD,
	CONTROLLER,
	MOUSE
}

/// @summary Initializes an input key.
function Input(_keyname_array, _input_type = INPUT_TYPE.KEYBOARD, _device = 0) constructor
{
	device = _device; // the gamepad to check.
	type = _input_type;
    input = []; // will contain all of the raw ASCII values.
	
	check = false;
	pressed = false;
	released = false;
	
	// function is called in step so keybinds get refreshed.
	static update = function(_keyname_array)
	{
		var _inputarr = [];
		// process _keyname_array into ASCII values.
		
		if !is_array(_keyname_array) //if not an array, make it a single one
			_keyname_array = [_keyname_array];
		
		for (var i = 0; i < array_length(_keyname_array); i++)
		{
		    var _keyname = _keyname_array[i];
		    // see if its a number value or not.
		    if (is_real(_keyname))
		        array_push(_inputarr, _keyname);
		    else if (is_string(_keyname))
		        array_push(_inputarr, ord(_keyname));
		}
		if (!array_equals(input, _inputarr))
			input = _inputarr;
			
		// since this uses an update method, we can actually just private all of the check methods and run them here.
		
		check = __check();
		pressed = __pressed();
		released = __released();
	}
    
	update(_keyname_array);
	
    // check methods
    static __check = function()
    {
		switch (type)
		{
			case INPUT_TYPE.KEYBOARD:
			{
				for (var i = 0; i < array_length(input); i++)
		        {
		            if (keyboard_check(input[i]))
		                return true;
		        }
		        return false;
			}
			case INPUT_TYPE.CONTROLLER:
			{
				// TODO: handle controller input
			}
			case INPUT_TYPE.MOUSE:
			{
				for (var i = 0; i < array_length(input); i++)
		        {
		            if (mouse_check_button(input[i]))
		                return true;
		        }
		        return false;
			}
		}

    }
    
    static __pressed = function()
    {
		switch (type)
		{
			case INPUT_TYPE.KEYBOARD:
			{
				for (var i = 0; i < array_length(input); i++)
		        {
		            if (keyboard_check_pressed(input[i]))
		                return true;
		        }
		        return false;
			}
			case INPUT_TYPE.CONTROLLER:
			{
				// TODO: handle controller input
			}
			case INPUT_TYPE.MOUSE:
			{
				for (var i = 0; i < array_length(input); i++)
		        {
		            if (mouse_check_button_pressed(input[i]))
		                return true;
		        }
		        return false;
			}
		}
    }
    
    static __released = function()
    { 
		switch (type)
		{
			case INPUT_TYPE.KEYBOARD:
			{
				for (var i = 0; i < array_length(input); i++)
		        {
		            if (keyboard_check_released(input[i]))
		                return true;
		        }
		        return false;
			}
			case INPUT_TYPE.CONTROLLER:
			{
				// TODO: handle controller input
			}
			case INPUT_TYPE.MOUSE:
			{
				for (var i = 0; i < array_length(input); i++)
		        {
		            if (mouse_check_button_released(input[i]))
		                return true;
		        }
		        return false;
			}
		}
    }
}


/// @deprecated
function get_input()
{
	/*var keybinds = {
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
	}*/
	
	key_left = setkey(global.keybinds.left)
	key_right = setkey(global.keybinds.right)	
	key_up = setkey(global.keybinds.up)
	key_down = setkey(global.keybinds.down)	
	key_jump = setkey(global.keybinds.jump)
	key_grab = setkey(global.keybinds.grab)
	key_dash = setkey(global.keybinds.dash)
	key_taunt = setkey(global.keybinds.taunt)
	
	uikey_left = setkey(global.keybinds.ui_left)
	uikey_right = setkey(global.keybinds.ui_right)
	uikey_up = setkey(global.keybinds.ui_up)
	uikey_down = setkey(global.keybinds.ui_down)
	uikey_accept = setkey(global.keybinds.ui_accept)
	uikey_deny = setkey(global.keybinds.ui_deny)
}
/// @deprecated
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