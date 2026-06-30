depth = -100
optionselected = 0
settingselected = 0
inputbuffer = 0
bg_inc = 0
bg_ix = 0
prev_bg_ix = 0
bg_spd = 0.5
bg_alpha = 0

types = {
	slider: 0,
	onoff: 1,
	func: 2,
	multichoice: 3, //val is array of [index, array of choices]
	change: 4
}

add_option = function(_name, _type, _val, _func = noone) constructor
{
	o_name = _name
	o_type = _type
	val = _val
	func = _func
}

add_option_back = function(_target_list = 0) constructor //back button for sublists
{
	o_name = "BACK"
	o_type = 4
	val = _target_list
	func = noone
}

func_windowmode = function(_mode)
{
	with instance_create(0, 0, obj_windowmodeconfirm)
	{
		prev_mode = global.option_windowmode
		change = _mode != global.option_windowmode
		global.option_windowmode = _mode
		if change
			event_user(0)
	}
}

//for change type, you have the val as an array [target index, index to go back to]
//-1 takes you back to the pause menu
list_arr = [
	[ //0 main
		new add_option("AUDIO",		types.change,	1),
		new add_option("VIDEO",		types.change,	2),
		new add_option("GAME",		types.change,	3),
		new add_option("CONTROLS",	types.change,	4),
	],
	[ //1 audio
		new add_option_back(),
		new add_option("MASTER", types.slider, global.option_master_volume,	
			function(_val) {
				
				global.option_master_volume = _val
				quick_ini_write_real("globalsave.ini", "options", "master_volume", _val)
			}),
		new add_option("MUSIC", types.slider, global.option_music_volume,	
			function(_val) {
				global.option_music_volume = _val
				audio_group_set_gain(ag_music, _val, 0)
				quick_ini_write_real("globalsave.ini", "options", "music_volume", _val)
			}),
		new add_option("SFX", types.slider, global.option_sfx_volume,
			function(_val) {
				global.option_sfx_volume = _val
				audio_group_set_gain(ag_sfx, _val, 0)
				quick_ini_write_real("globalsave.ini", "options", "sfx_volume", _val)
			}),
		new add_option("UNFOCUSED MUTE", types.onoff, global.option_unfocus_mute, 
			function(_val) {
				global.option_unfocus_mute = _val
				quick_ini_write_real("globalsave.ini", "options", "unfocus_mute", _val)
			})
	],
	[ //2 video
		new add_option_back(),
		new add_option("WINDOW MODE", types.change, 5),
		new add_option("RESOLUTION", types.multichoice, [global.option_chosen_res, global.option_res_strings],	
			function(_val) {
				global.option_chosen_res = _val[0]
				var _split = string_split(_val[1][global.option_chosen_res], "X")
				
				window_set_size(real(_split[0]), real(_split[1]))
				window_center()
				quick_ini_write_real("globalsave.ini", "options", "chosen_res", global.option_chosen_res)
			}),
		new add_option("VSYNC", types.onoff, global.option_vsync,
			function(_val) {
				global.option_vsync = _val
				display_reset(0, _val)
				quick_ini_write_real("globalsave.ini", "options", "vsync", _val)
			}),
		new add_option("TEXTURE FILTERING", types.onoff, global.option_texturefilter,
			function(_val) {
				global.option_texturefilter = _val
				quick_ini_write_real("globalsave.ini", "options", "texturefilter", _val)
			}),
		new add_option("SHOW HUD", types.onoff, global.option_showhud,
			function(_val) {
				global.option_showhud = _val
				quick_ini_write_real("globalsave.ini", "options", "showhud", _val)
			})
	],
	[ //3 game
		new add_option_back(),
		//wip section because controller and timer
		//new add_option("LANGUAGE",			types.change, 64), theres no way in hell a fangame will have this. but ill leave this placeholder for keepssake incase it does
		new add_option("RUMBLE", types.onoff, global.option_rumble,
			function(_val) {
				global.option_rumble = _val
				quick_ini_write_real("globalsave.ini", "options", "rumble", _val)
			}),
		new add_option("SCREEN SHAKE", types.onoff, global.option_screenshake,
			function(_val) {
				global.option_screenshake = _val
				quick_ini_write_real("globalsave.ini", "options", "screenshake", _val)
			}),
		new add_option("TIMER",	types.onoff, global.option_timer,
			function(_val) {
				global.option_timer = _val
				quick_ini_write_real("globalsave.ini", "options", "timer", _val)
			}),
		new add_option("TIMER TYPE", types.multichoice, [global.option_timertype, ["PER LEVEL", "PER SAVE", "BOTH"]],	
			function(_val) {
				global.option_timertype = _val[0]
				quick_ini_write_real("globalsave.ini", "options", "timertype", global.option_timertype)
			}),
		new add_option("SPEEDRUN TIMER", types.onoff, global.option_timerspeedrun,
			function(_val) {
				if _val
					instance_activate_object(obj_timer)
				else
					instance_deactivate_object(obj_timer)
				global.option_timerspeedrun = _val
				quick_ini_write_real("globalsave.ini", "options", "timerspeedrun", _val)
			})
	],
	[ //4 controls
		new add_option_back(),
		new add_option("KEYBOARD",		types.change, 6),
		new add_option("CONTROLLER",	types.change, 7),
		new add_option("RESET CONFIG",	types.func,	  8,
			function(_val) { //horribly hardcoded but whatever
				file_delete(global.keybinds_filename)
				
				global.bindslist = variable_clone(global.bindlist_defaults)
				
				ini_open("globalsave.ini")
				
				global.option_dirsuperjump = true
				ini_write_real("options", "dirsuperjump", true)
				list_arr[6][2].val = true 
				
				global.option_dirgroundpound = true
				ini_write_real("options", "dirgroundpound", true)
				list_arr[6][3].val = true
				
				global.option_joysuperjump = true
				ini_write_real("options", "joysuperjump", true)
				list_arr[7][3].val = true
				
				global.option_joygroundpound = true
				ini_write_real("options", "joygroundpound", true)
				list_arr[7][4].val = true
				
				global.option_dzgeneral = 0.4
				ini_write_real("options", "dzgeneral", 0.4)
				list_arr[8][1].val = 0.4
				
				global.option_dzhorizontal = 0.1
				ini_write_real("options", "dzhorizontal", 0.1)
				list_arr[8][2].val = 0.1
				
				global.option_dzvertical = 0.1
				ini_write_real("options", "dzvertical", 0.1)
				list_arr[8][3].val = 0.1
				
				global.option_dzbutton = 0.15
				ini_write_real("options", "dzbutton", 0.15)
				list_arr[8][4].val = 0.15
				
				global.option_dzsuperjump = 0.85
				ini_write_real("options", "dzsuperjump", 0.85)
				list_arr[8][5].val = 0.85
				
				global.option_dzcrouchwalk = 0.65
				ini_write_real("options", "dzcrouchwalk", 0.65)
				list_arr[8][6].val = 0.65
				
				ini_close()
				
				do_tip("{u}Configuration resetted!")
			}),
	],
	[ //5 video mode, val is in order of this list
		new add_option_back(2),
		new add_option("WINDOWED",		types.func,	0,	func_windowmode),
		new add_option("FULLSCREEN",	types.func,	1,	func_windowmode),
		new add_option("BORDERLESS",	types.func,	2,	func_windowmode)
	],
	[ //6 keyboard specific controls
		new add_option_back(4),
		new add_option("BINDINGS", types.func, undefined,
			function(_val) {
				instance_create(x, y, obj_keyconfig)
			}),
		new add_option("DIR. SUPERJUMP", types.onoff, global.option_dirsuperjump,
			function(_val) {
				global.option_dirsuperjump = _val
				quick_ini_write_real("globalsave.ini", "options", "dirsuperjump", _val)
			}),
		new add_option("DIR. GROUNDPOUND", types.onoff, global.option_dirgroundpound,
			function(_val) {
				global.option_dirgroundpound = _val
				quick_ini_write_real("globalsave.ini", "options", "dirgroundpound", _val)
			}),
	],
	[ //7 gamepad specific controls
		new add_option_back(4),
		new add_option("BINDINGS", types.func, undefined,
			function(_val) {
				instance_create(x, y, obj_buttonconfig)
			}),
		new add_option("DEADZONES", types.change, 8),
		new add_option("JOYSTICK SUPERJUMP", types.onoff, global.option_joysuperjump,
			function(_val) {
				global.option_joysuperjump = _val
				quick_ini_write_real("globalsave.ini", "options", "joysuperjump", _val)
			}),
		new add_option("JOYSTICK GROUNDPOUND", types.onoff, global.option_joygroundpound,
			function(_val) {
				global.option_joygroundpound = _val
				quick_ini_write_real("globalsave.ini", "options", "joygroundpound", _val)
			}),
	],
	[ //8 gamepad deadzones
		new add_option_back(7),
		new add_option("GENERAL DEADZONE", types.slider, global.option_dzgeneral,	
			function(_val) {
				global.option_dzgeneral = _val
				quick_ini_write_real("globalsave.ini", "options", "dzgeneral", _val)
				gamepad_set_axis_deadzone(global.pad_device, _val)
			}),
		new add_option("HORIZ. DEADZONE", types.slider, global.option_dzhorizontal,	
			function(_val) {
				global.option_dzhorizontal = _val
				quick_ini_write_real("globalsave.ini", "options", "dzhorizontal", _val)
			}),
		new add_option("VERT. DEADZONE", types.slider, global.option_dzvertical,	
			function(_val) {
				global.option_dzvertical = _val
				quick_ini_write_real("globalsave.ini", "options", "dzvertical", _val)
			}),
		new add_option("PRESS DEADZONE", types.slider, global.option_dzbutton,	
			function(_val) {
				global.option_dzbutton = _val
				quick_ini_write_real("globalsave.ini", "options", "dzbutton", _val)
				gamepad_set_button_threshold(global.pad_device, _val)
			}),
		new add_option("SUPERJUMP WALK DZ", types.slider, global.option_dzsuperjump,	
			function(_val) {
				global.option_dzsuperjump = _val
				quick_ini_write_real("globalsave.ini", "options", "dzsuperjump", _val)
			}),
		new add_option("CROUCH WALK DZ", types.slider, global.option_dzcrouchwalk,	
			function(_val) {
				global.option_dzcrouchwalk = _val
				quick_ini_write_real("globalsave.ini", "options", "dzcrouchwalk", _val)
			}),
	]
]

array_foreach(list_arr[0], function(_element, _index) { //giving the main 4 their icons
	_element.iconalpha = 0
	_element.icon_ix = _index + 4
})

list_arr[64] = [new add_option("SORRY NOTHING",	types.change, 0)] //"max" index
list_ix = 0
back_ix = -1
cur_list = list_arr[list_ix]

snd_frogscream = noone

if instance_exists(obj_menuhandler)
	audio_sound_gain(obj_menuhandler.static_snd, 0)

//i could reduce the amount of new functions made here actually,,,, maybe tdp was right to have seperate functions for each type