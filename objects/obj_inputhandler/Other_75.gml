/// @description Asynchrounous gamepad connection
if async_load[? "event_type"] == "gamepad discovered"
{
	global.input_type = INPUT_TYPE.CONTROLLER
	show_debug_message("controller found")
}
else if async_load[? "event_type"] == "gamepad lost"
{
	global.input_type = INPUT_TYPE.KEYBOARD
	show_debug_message("controller lost")
}
