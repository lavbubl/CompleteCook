player_input_device[0] = -2
player_input_device[1] = -2
device_selected[0] = 0
device_selected[1] = 0
press_start = 0
deactivated = 0
device_to_reconnect = 0
prevstate[0] = states.titlescreen
prevstate[1] = states.titlescreen
vibration[0][0] = 0
vibration[0][1] = 0
vibration[0][2] = 0
vibration[1][0] = 0
vibration[1][1] = 0
vibration[1][2] = 0

setVibration = function(argument0, argument1, argument2, argument3)
{
	vibration[argument0][0] = argument1
	vibration[argument0][1] = argument2
	if (argument3 != undefined)
		vibration[argument0][2] = argument3
	exit;
}

function CheckUsedIndex(argument0)
{
	for (var _x = 0; _x < 2; _x++)
	{
		if (player_input_device[_x] == argument0)
			return true;
	}
	return false;
}

