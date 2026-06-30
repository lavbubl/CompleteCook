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
	ui_start,
	ui_confirm,
	ui_back,
	ui_quit,
	ui_delete,
	bind_reset
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
		
		var _name_list = ["left", //convert an INPUT constant to a name to find in global.bindslist
						  "right",
						  "up",
						  "down",
						  "dash",
						  "jump",
						  "grab",
						  "taunt",
						  "superjump",
						  "groundpound",
						  "ui_left",
						  "ui_right",
						  "ui_up",
						  "ui_down",
						  "ui_start",
						  "ui_confirm",
						  "ui_back",
						  "ui_quit",
						  "ui_delete",
						  "bind_reset"]
		
		_bind_arr = global.bindslist[$ _name_list[_input_enum]][_ix] //get the keyboard/controller button from its name
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

/// @summary keyboard_check(vk_any) equivelant for gamepad
function gamepad_check_any(_device = global.pad_device) //the equivelant just doesn't exist natively, so you have to do this
{
	for (var i = 0; i < array_length(global.button_arr); i++) { //loop through every axis to see if its input is above half
		if gamepad_button_check(_device, global.button_arr[i])
			return true;
	}
}

/// @summary keyboard_check_pressed(vk_any) equivelant for gamepad
function gamepad_check_pressed_any(_device = global.pad_device)
{
	for (var i = 0; i < array_length(global.button_arr); i++) { //loop through every axis to see if its input is above half
		if gamepad_button_check_pressed(_device, global.button_arr[i])
			return true;
	}
}

/// @summary keyboard_check_pressed(vk_any) equivelant for gamepad
function gamepad_check_released_any(_device = global.pad_device)
{
	for (var i = 0; i < array_length(global.button_arr); i++) { //loop through every axis to see if its input is above half
		if gamepad_button_check_released(_device, global.button_arr[i])
			return true;
	}
}

/// @summary Return the first button found in their array pressed.
function gamepad_get_button(_device = global.pad_device)
{
	for (var i = 0; i < array_length(global.button_arr); i++) {
		if gamepad_button_check(_device, global.button_arr[i])
			return global.button_arr[i];
	}
}

/*
function gamepad_axis_check(_axis, _device = global.pad_device) {
	if global.input_type != INPUT_TYPE.CONTROLLER
		return false;
	
	switch _axis
	{
		case gp_axislh:
			return abs(gamepad_axis_value(_device, gp_axislh)) > global.option_dzhorizontal;
		case gp_axislv:
			return abs(gamepad_axis_value(_device, gp_axislv)) > global.option_dzvertical;
		case gp_axisrh:
			return abs(gamepad_axis_value(_device, gp_axisrh)) > global.option_dzhorizontal;
		case gp_axisrv:
			return abs(gamepad_axis_value(_device, gp_axisrv)) > global.option_dzvertical;
	}
}

function gamepad_axis_check_pressed(_axis, _device = global.pad_device) {
	if global.input_type != INPUT_TYPE.CONTROLLER
		return false;
	
	static _prev_held = false
	static _axis_held = {
		lh: false,
		lv: false,
		rh: false,
		rv: false
	}
	
	switch _axis
	{
		case gp_axislh:
			_prev_held = _axis_held.lh
			_axis_held.lh = abs(gamepad_axis_value(_device, gp_axislh)) > global.option_dzhorizontal
			return _axis_held.lh && !_prev_held; //pressed
		case gp_axislv:
			_prev_held = _axis_held.lv
			_axis_held.lv = abs(gamepad_axis_value(_device, gp_axislv)) > global.option_dzvertical
			return _axis_held.lv && !_prev_held;
		case gp_axisrh:
			_prev_held = _axis_held.rh
			_axis_held.rh = abs(gamepad_axis_value(_device, gp_axisrh)) > global.option_dzhorizontal
			return _axis_held.rh && !_prev_held;
		case gp_axisrv:
			_prev_held = _axis_held.rv
			_axis_held.rv = abs(gamepad_axis_value(_device, gp_axisrv)) > global.option_dzvertical
			return _axis_held.rv && !_prev_held;
	}
}

function gamepad_axis_check_released(_axis, _device = global.pad_device) {
	if global.input_type != INPUT_TYPE.CONTROLLER
		return false;
	
	static _prev_held = false
	static _axis_held = {
		lh: false,
		lv: false,
		rh: false,
		rv: false
	}
	
	switch _axis
	{
		case gp_axislh:
			_prev_held = _axis_held.lh
			_axis_held.lh = abs(gamepad_axis_value(_device, gp_axislh)) > global.option_dzhorizontal
			return !_axis_held.lh && _prev_held; //released
		case gp_axislv:
			_prev_held = _axis_held.lv
			_axis_held.lv = abs(gamepad_axis_value(_device, gp_axislv)) > global.option_dzvertical
			return !_axis_held.lv && _prev_held;
		case gp_axisrh:
			_prev_held = _axis_held.rh
			_axis_held.rh = abs(gamepad_axis_value(_device, gp_axisrh)) > global.option_dzhorizontal
			return !_axis_held.rh && _prev_held;
		case gp_axisrv:
			_prev_held = _axis_held.rv
			_axis_held.rv = abs(gamepad_axis_value(_device, gp_axisrv)) > global.option_dzvertical
			return !_axis_held.rv && _prev_held;
	}
}
*/

/// @param direction INPUTS.left, etc, and ui variants
function input_direction_check(_dir, _device = global.pad_device) {
	var _axis_check = false
	
	if global.input_type == INPUT_TYPE.CONTROLLER
	{
		switch _dir
		{
			case INPUTS.left:
			case INPUTS.ui_left:
				_axis_check = gamepad_axis_value(_device, gp_axislh) < -global.option_dzhorizontal
			case INPUTS.right:
			case INPUTS.ui_right:
				_axis_check = gamepad_axis_value(_device, gp_axislh) > global.option_dzhorizontal
			case INPUTS.up:
			case INPUTS.ui_up:
				_axis_check = gamepad_axis_value(_device, gp_axislv) < -global.option_dzvertical
			case INPUTS.down:
			case INPUTS.ui_down:
				_axis_check = gamepad_axis_value(_device, gp_axislv) > global.option_dzvertical
		}
	}
	
	return input_check(_dir) || _axis_check;
}

/// @param direction INPUTS.left, etc, and ui variants
function input_direction_check_pressed(_dir, _device = global.pad_device) {
	var _axis_check = false
	
	static _prev_held = false
	static _axis_held = {
		left: false,
		right: false,
		up: false,
		down: false
	}
	
	if global.input_type == INPUT_TYPE.CONTROLLER
	{
		switch _dir
		{
			case INPUTS.left:
			case INPUTS.ui_left:
				_prev_held = _axis_held.left
				_axis_held.left = gamepad_axis_value(_device, gp_axislh) < -global.option_dzhorizontal
				_axis_check = _axis_held.left && !_prev_held
			case INPUTS.right:
			case INPUTS.ui_right:
				_prev_held = _axis_held.right
				_axis_held.right = gamepad_axis_value(_device, gp_axislh) > global.option_dzhorizontal
				_axis_check = _axis_held.right && !_prev_held
			case INPUTS.up:
			case INPUTS.ui_up:
				_prev_held = _axis_held.up
				_axis_held.up = gamepad_axis_value(_device, gp_axislv) < -global.option_dzvertical
				_axis_check = _axis_held.up && !_prev_held
			case INPUTS.down:
			case INPUTS.ui_down:
				_prev_held = _axis_held.down
				_axis_held.down = gamepad_axis_value(_device, gp_axislv) > global.option_dzvertical
				_axis_check = _axis_held.down && !_prev_held
		}
	}
	
	return input_check_pressed(_dir) || _axis_check;
}

/// @param direction INPUTS.left, etc, and ui variants
function input_direction_check_released(_dir, _device = global.pad_device) {
	var _axis_check = false
	
	static _prev_held = false
	static _axis_held = {
		left: false,
		right: false,
		up: false,
		down: false
	}
	
	if global.input_type == INPUT_TYPE.CONTROLLER
	{
		switch _dir
		{
			case INPUTS.left:
			case INPUTS.ui_left:
				_prev_held = _axis_held.left
				_axis_held.left = gamepad_axis_value(_device, gp_axislh) < -global.option_dzhorizontal
				_axis_check = !_axis_held.left && _prev_held
			case INPUTS.right:
			case INPUTS.ui_right:
				_prev_held = _axis_held.right
				_axis_held.right = gamepad_axis_value(_device, gp_axislh) > global.option_dzhorizontal
				_axis_check = !_axis_held.right && _prev_held
			case INPUTS.up:
			case INPUTS.ui_up:
				_prev_held = _axis_held.up
				_axis_held.up = gamepad_axis_value(_device, gp_axislv) < -global.option_dzvertical
				_axis_check = !_axis_held.up && _prev_held
			case INPUTS.down:
			case INPUTS.ui_down:
				_prev_held = _axis_held.down
				_axis_held.down = gamepad_axis_value(_device, gp_axislv) > global.option_dzvertical
				_axis_check = !_axis_held.down && _prev_held
		}
	}
	
	return input_check_released(_dir) || _axis_check;
}
