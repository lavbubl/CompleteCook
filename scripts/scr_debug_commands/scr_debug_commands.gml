function string_split(argument0, argument1)
{
	argument0 += " "
	var _current_str = ""
	var _list = [0]
	for (var i = 1; i < string_length(argument0) + 1; i++)
	{
		var _char = string_char_at(argument0, i)
		if _char != argument1
			_current_str += _char
		else
		{
			array_push(_list, _current_str)
			_current_str = ""
		}
	}
	return _list;
}

function function_overload(args_array, func)
{
	var _size = array_length(args_array)
	switch _size - 1
	{
		case -1:
			func()
			break
		case 0:
			func(args_array[0])
			break
		case 1:
			func(args_array[0], args_array[1])
			break
		case 2:
			func(args_array[0], args_array[1], args_array[2])
			break
		case 3:
			func(args_array[0], args_array[1], args_array[2], args_array[3])
			break
		case 4:
			func(args_array[0], args_array[1], args_array[2], args_array[3], args_array[4])
			break
		case 5:
			func(args_array[0], args_array[1], args_array[2], args_array[3], args_array[4], args_array[5])
			break
		case 6:
			func(args_array[0], args_array[1], args_array[2], args_array[3], args_array[4], args_array[5], args_array[6])
			break
	}
}

function DebugCommand(command_ident, command_description, command_format, command_func) constructor
{
	command_id = command_ident
	description = command_description
	format = command_format
	func = command_func
	
	Invoke = function(args)
	{
		if args != undefined
			function_overload(args, func)
		else
			func()
	}
}

function TextList_Add(argument0, argument1)
{
	with obj_debugcontroller
	{
		
	}
}
