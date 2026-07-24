/// @description Change the input type based on what input comes
if keyboard_check(vk_anykey)
	global.input_type = INPUT_TYPE.KEYBOARD
if gamepad_check_any() //controller has priority over keyboard, that's just how it is
	global.input_type = INPUT_TYPE.CONTROLLER
