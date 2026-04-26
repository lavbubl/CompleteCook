/// @description Input initialization
global.input_type = INPUT_TYPE.KEYBOARD

if gamepad_is_connected(0)
{
	global.input_type = INPUT_TYPE.CONTROLLER
	show_debug_message("controller found")
}

global.pad_device = 0

global.bindslist = { //keyboard binds					gamepad binds
	left:			[vk_left,							gp_padl], //replace the controller section with global.gamepadbinds.#
	right:			[vk_right,							gp_padr],
	up:				[vk_up,								gp_padu],
	down:			[vk_down,							gp_padd],
	dash:			[vk_shift,							[gp_shoulderrb, gp_shoulderr]],
	jump:			["Z",								gp_face1],
	grab:			["X",								gp_face3],
	taunt:			["C",								gp_face4],
	superjump:		[vk_nokey,							vk_nokey],
	groundpound:	[vk_nokey,							vk_nokey],
	ui_left:		[vk_left,							gp_padl],
	ui_right:		[vk_right,							gp_padr],
	ui_up:			[vk_up,								gp_padu],
	ui_down:		[vk_down,							gp_padd],
	ui_start:		[vk_escape,							gp_start],
	ui_accept:		[[vk_enter, vk_space, "Z"],			[gp_face1, gp_start]],
	ui_deny:		[[vk_escape, vk_backspace, "X"],	gp_face3],
	bind_reset:		[vk_f1,								gp_select],
	bind_add:		["Z",								gp_face1],
	bind_clear:		["C",								gp_face4],
}

global.keybinds_filename = "keybinds.json"

var _file = undefined

if !file_exists(global.keybinds_filename)
{
	_file = file_text_open_write(global.keybinds_filename)
	var _bindjson = json_stringify(global.bindslist)
	
	file_text_write_string(_file, _bindjson)
}
else
{
	var msg = "ERROR!\n\nKeybind data is incompatable, input set to defaults."
	try
	{
		_file = file_text_open_read(global.keybinds_filename)
		var _parsed_json = json_parse(file_text_read_string(_file))
		var sorted_binds = struct_get_names(global.bindslist)
		var sorted_json = struct_get_names(_parsed_json)
		array_sort(sorted_binds, true)
		array_sort(sorted_json, true)
		show_debug_message(sorted_binds)
		show_debug_message(sorted_json)
		if !array_equals(sorted_binds, sorted_json) //alphabetically sorted bindslist to check matching
		{
			_file = file_text_open_write(global.keybinds_filename)
			var _bindjson = json_stringify(global.bindslist)
			file_text_write_string(_file, _bindjson)
			show_message(msg)
		}
		else
			global.bindslist = _parsed_json
	}
	catch(_exception)
	{
		show_message(msg)
		show_debug_message(_exception.longMessage);
		show_debug_message(_exception.script);
		show_debug_message(_exception.stacktrace);
	}
}

file_text_close(_file)

global.axis_arr = [gp_axislh, gp_axislv, gp_axisrh, gp_axisrv] //the joysticks

global.button_arr = [gp_face1, gp_face2, gp_face3, gp_face4, //every button constant
					 gp_shoulderl, gp_shoulderlb, gp_shoulderr, gp_shoulderrb,
					 gp_select, gp_start, gp_stickl, gp_stickr,
					 gp_padu, gp_padd, gp_padl, gp_padr,
					 gp_home, gp_touchpadbutton, gp_paddler, gp_paddlel,
					 gp_paddlerb, gp_paddlelb, gp_extra1, gp_extra2,
					 gp_extra3, gp_extra4, gp_extra5, gp_extra6]

#region Keycode definition

#region Keyboard

global.keycodes = []
global.keycodes[0][ord("A")]			= "A"
global.keycodes[0][ord("B")]			= "B"
global.keycodes[0][ord("C")]			= "C"
global.keycodes[0][ord("D")]			= "D"
global.keycodes[0][ord("E")]			= "E"
global.keycodes[0][ord("F")]			= "F"
global.keycodes[0][ord("G")]			= "G"
global.keycodes[0][ord("H")]			= "H"
global.keycodes[0][ord("I")]			= "I"
global.keycodes[0][ord("J")]			= "J"
global.keycodes[0][ord("K")]			= "K"
global.keycodes[0][ord("L")]			= "L"
global.keycodes[0][ord("M")]			= "M"
global.keycodes[0][ord("N")]			= "N"
global.keycodes[0][ord("O")]			= "O"
global.keycodes[0][ord("P")]			= "P"
global.keycodes[0][ord("Q")]			= "Q"
global.keycodes[0][ord("R")]			= "R"
global.keycodes[0][ord("S")]			= "S"
global.keycodes[0][ord("T")]			= "T"
global.keycodes[0][ord("U")]			= "U"
global.keycodes[0][ord("V")]			= "V"
global.keycodes[0][ord("W")]			= "W"
global.keycodes[0][ord("X")]			= "X"
global.keycodes[0][ord("Y")]			= "Y"
global.keycodes[0][ord("Z")]			= "Z"
global.keycodes[0][vk_control]			= "Control"
global.keycodes[0][vk_lcontrol]			= "LCtrl"
global.keycodes[0][vk_rcontrol]			= "LRtrl"
global.keycodes[0][vk_alt]				= "Alt"
global.keycodes[0][vk_lalt]				= "LAlt" //Left Alt
global.keycodes[0][vk_ralt]				= "RAlt" //Right Alt
global.keycodes[0][ord(";")]			= ";"
global.keycodes[0][ord("'")]			= "Apostrph"
global.keycodes[0][vk_enter]			= "Enter"
global.keycodes[0][ord("\\")]			= "VertBar"
global.keycodes[0][vk_backspace]		= "Backspace"
global.keycodes[0][vk_escape]			= "Escape"
global.keycodes[0][ord("[")]			= "LBracket"
global.keycodes[0][ord("]")]			= "RBracket"
global.keycodes[0][ord(",")]			= "Comma"
global.keycodes[0][ord(".")]			= "Dot"
global.keycodes[0][ord("/")]			= "Slash"
global.keycodes[0][vk_shift]			= "Shift"
global.keycodes[0][vk_lshift]			= "LShift" //Left Shift
global.keycodes[0][vk_rshift]			= "RShift" //Right Shift
global.keycodes[0][vk_tab]				= "Tab"
global.keycodes[0][ord("`")]			= "Tilde"
global.keycodes[0][vk_printscreen]		= "Printscreen"
global.keycodes[0][ord("0")]			= "0"
global.keycodes[0][ord("1")]			= "1"
global.keycodes[0][ord("2")]			= "2"
global.keycodes[0][ord("3")]			= "3"
global.keycodes[0][ord("4")]			= "4"
global.keycodes[0][ord("5")]			= "5"
global.keycodes[0][ord("6")]			= "6"
global.keycodes[0][ord("7")]			= "7"
global.keycodes[0][ord("8")]			= "8"
global.keycodes[0][ord("9")]			= "9"
global.keycodes[0][vk_numpad0]			= "Numpad 0"
global.keycodes[0][vk_numpad1]			= "Numpad 1"
global.keycodes[0][vk_numpad2]			= "Numpad 2"
global.keycodes[0][vk_numpad3]			= "Numpad 3"
global.keycodes[0][vk_numpad4]			= "Numpad 4"
global.keycodes[0][vk_numpad5]			= "Numpad 5"
global.keycodes[0][vk_numpad6]			= "Numpad 6"
global.keycodes[0][vk_numpad7]			= "Numpad 7"
global.keycodes[0][vk_numpad8]			= "Numpad 8"
global.keycodes[0][vk_numpad9]			= "Numpad 9"
global.keycodes[0][vk_add]				= "Add"
global.keycodes[0][vk_subtract]			= "Subtract"
global.keycodes[0][vk_multiply]			= "Multiply"
global.keycodes[0][vk_divide]			= "Divide"
global.keycodes[0][vk_decimal]			= "Decimal"
global.keycodes[0][vk_f1]				= "F1"
global.keycodes[0][vk_f2]				= "F2"
global.keycodes[0][vk_f3]				= "F3"
global.keycodes[0][vk_f4]				= "F4"
global.keycodes[0][vk_f5]				= "F5"
global.keycodes[0][vk_f6]				= "F6"
global.keycodes[0][vk_f7]				= "F7"
global.keycodes[0][vk_f8]				= "F8"
global.keycodes[0][vk_f9]				= "F9"
global.keycodes[0][vk_f10]				= "F10"
global.keycodes[0][vk_f11]				= "F11"
global.keycodes[0][vk_f12]				= "F12"
global.keycodes[0][124]					= "F13"
global.keycodes[0][125]					= "F14"
global.keycodes[0][126]					= "F15"
global.keycodes[0][127]					= "F16"
global.keycodes[0][128]					= "F17"
global.keycodes[0][129]					= "F18"
global.keycodes[0][130]					= "F19"
global.keycodes[0][131]					= "F20"
global.keycodes[0][132]					= "F21"
global.keycodes[0][133]					= "F22"
global.keycodes[0][134]					= "F23"
global.keycodes[0][135]					= "F24"
global.keycodes[0][145]					= "ScrollLck"
global.keycodes[0][vk_pause]			= "Pause"
global.keycodes[0][20]					= "Caps Lock"
global.keycodes[0][ord("-")]			= "Underscr"
global.keycodes[0][ord("=")]			= "Equal"
global.keycodes[0][vk_insert]			= "Insert"
global.keycodes[0][vk_home]				= "Home"
global.keycodes[0][vk_pageup]			= "Page Up"
global.keycodes[0][vk_pagedown]			= "Page Down"
global.keycodes[0][vk_end]				= "End"
global.keycodes[0][vk_delete]			= "Delete"
global.keycodes[0][144]					= "NumLck"
global.keycodes[0][vk_left]				= "Left"
global.keycodes[0][vk_up]				= "Up"
global.keycodes[0][vk_right]			= "Right"
global.keycodes[0][vk_down]				= "Down"
global.keycodes[0][91]					= "LExplr"
global.keycodes[0][92]					= "RExplr"
global.keycodes[0][vk_space]			= "Space"
global.keycodes[0][179]					= "Play"
global.keycodes[0][173]					= "Mute"
global.keycodes[0][174]					= "Volume Down"
global.keycodes[0][175]					= "Volume Up"

#endregion

#region Controller

global.keycodes[1][gp_face1]			= "Face 1"
global.keycodes[1][gp_face2]			= "Face 2"
global.keycodes[1][gp_face3]			= "Face 3"
global.keycodes[1][gp_face4]			= "Face 4"
global.keycodes[1][gp_shoulderlb]		= "LSldrTgr"
global.keycodes[1][gp_shoulderrb]		= "RSldrTgr"
global.keycodes[1][gp_shoulderr]		= "RSldrBtn"
global.keycodes[1][gp_shoulderl]		= "LSldrBtn"
global.keycodes[1][gp_stickl]			= "LStick"
global.keycodes[1][gp_stickr]			= "RStick"
global.keycodes[1][gp_padu]				= "D-padUp"
global.keycodes[1][gp_padr]				= "D-padRight"
global.keycodes[1][gp_padd]				= "D-padDown"
global.keycodes[1][gp_padl]				= "D-padLeft"
global.keycodes[1][gp_start]			= "Start"
global.keycodes[1][gp_select]			= "Select"
global.keycodes[1][gp_home] 			= "Home"
global.keycodes[1][gp_touchpadbutton] 	= "Touchpad"
global.keycodes[1][gp_paddler]			= "RPaddle"
global.keycodes[1][gp_paddlel]			= "LPaddle"
global.keycodes[1][gp_paddlerb]			= "RPaddle2"
global.keycodes[1][gp_paddlelb] 		= "LPaddle2"
global.keycodes[1][gp_extra1]			= "Extra 1"
global.keycodes[1][gp_extra2]			= "Extra 2"
global.keycodes[1][gp_extra3]			= "Extra 3"
global.keycodes[1][gp_extra4]			= "Extra 4"
global.keycodes[1][gp_extra5]			= "Extra 5"
global.keycodes[1][gp_extra6]			= "Extra 6"

#endregion
 
#endregion
