/*

	Quick usage tutorial:
	
	The input functions in this script are designed for you to input a constant from the INPUTS
	enum, so that keybinds can switch from global binds from keyboards to gamepads. Vice versa.
	
	You can also input true for the 2nd argument for input checks, so that you can input an array
	outside of global.bindslist, see the example of this functionality used in obj_menuhandler.
	
	Refer to obj_inputhandler's creation code for many global variable definitions.
*/

enum INPUTS
{
	left,
	right,
	up,
	down,
	dash,
	jump,
	grab,
	taunt,
	superjump,
	groundpound,
	ui_left,
	ui_right,
	ui_up,
	ui_down,
	ui_accept,
	ui_deny
}

enum INPUT_TYPE
{
	KEYBOARD,
	CONTROLLER,
	MOUSE
}

/// @summary Get the bind from the INPUTS enum, use a single vk/gp constant/string or key arrays.
function input_get_bind(_input_enum, _is_special_key = false)
{
	var _bind_arr = _input_enum
	
	if instance_exists(obj_shell) && obj_shell.isOpen
		return [vk_nokey];
	
	if !_is_special_key
	{
		var _ix = 0 //keyboard
		if global.input_type == INPUT_TYPE.CONTROLLER
			_ix = 1
		_bind_arr = global.bindslist[_input_enum][_ix]
	}
	
	if !is_array(_bind_arr) //if not an array, make it a single one
		_bind_arr = [_bind_arr]
	
	for (var i = 0; i < array_length(_bind_arr); i++)
	{
	   if is_string(_bind_arr[i])
	        _bind_arr[i] = ord(_bind_arr[i]);
	}
	
	return _bind_arr;
}

/// @summary Checks if a bind is being held.
function input_check(_input_enum, _is_special_key = false)
{
	var _input = input_get_bind(_input_enum, _is_special_key)
	for (var i = 0; i < array_length(_input); i++)
	{
		if _input[i] == vk_nokey //making sure a blank key is invalid
			continue;
		else if global.input_type == INPUT_TYPE.KEYBOARD && keyboard_check(_input[i])
			return true;
		else if global.input_type == INPUT_TYPE.CONTROLLER && gamepad_button_check(global.pad_device, _input[i])
			return true;
	}
	return false;
}

/// @summary Checks if a bind was pressed.
function input_check_pressed(_input_enum, _is_special_key = false)
{
	var _input = input_get_bind(_input_enum, _is_special_key)
	for (var i = 0; i < array_length(_input); i++)
	{
		if _input[i] == vk_nokey
			continue;
		else if global.input_type == INPUT_TYPE.KEYBOARD && keyboard_check_pressed(_input[i])
			return true;
		else if global.input_type == INPUT_TYPE.CONTROLLER && gamepad_button_check_pressed(global.pad_device, _input[i])
			return true;
	}
	return false;
}

/// @summary Checks if a bind was released.
function input_check_released(_input_enum, _is_special_key = false)
{
	var _input = input_get_bind(_input_enum, _is_special_key)
	for (var i = 0; i < array_length(_input); i++)
	{
		if _input[i] == vk_nokey
			continue;
		else if global.input_type == INPUT_TYPE.KEYBOARD && keyboard_check_released(_input[i])
			return true;
		else if global.input_type == INPUT_TYPE.CONTROLLER && gamepad_button_check_released(global.pad_device, _input[i])
			return true;
	}
	return false;
}
