/*global.input_func = 
{
	check: keyboard_check,
	pressed: keyboard_check_pressed,
	released: keyboard_check_released
} //switch to either keyboard or controller functions when applicable

global.input_type = INPUT_TYPE.KEYBOARD*/

global.input_type = INPUT_TYPE.CONTROLLER
global.pad_device = 0

global.bindslist = []
event_user(0) //Redefine the binds list
