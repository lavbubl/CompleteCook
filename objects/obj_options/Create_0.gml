// declare input
input_handler = new InputHandler(obj_inputcontroller.main_gamepad).AddInput(["ui_left", "ui_right", "ui_up", "ui_down", "ui_accept", "ui_deny"]).Finalize();

ui_input =
{
	left: false,
	right: false,
	up: false,
	down: false,
	accept: false,
	deny: false
};

update_input = function()
{
    ui_input.left = input_handler.get_input("ui_left");
    ui_input.right = input_handler.get_input("ui_right");
    ui_input.up = input_handler.get_input("ui_up");
    ui_input.down = input_handler.get_input("ui_down");
    ui_input.accept = input_handler.get_input("ui_accept");
    ui_input.deny = input_handler.get_input("ui_deny");
}

depth = -100

optionselected = 0
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
		/*new add_option("RESET ALL CONFIG",	types.func, undefined,	
			function(_val) {
				if file_exists("globalsave.ini")
					file_delete("globalsave.ini")
				scr_sound(sfx_enemyprojectile)
			})*/
	],
	[ //1 audio
		new add_option_back(),
		new add_option("MASTER", types.slider, global.option_master_volume * 100,	
			function(_val) {
				_val /= 100
				global.option_master_volume = _val
				quick_ini_write_real("globalsave.ini", "options", "master_volume", _val)
			}),
		new add_option("MUSIC", types.slider, global.option_music_volume * 100,	
			function(_val) {
				_val /= 100
				global.option_music_volume = _val
				audio_group_set_gain(ag_music, _val, 0)
				quick_ini_write_real("globalsave.ini", "options", "music_volume", _val)
			}),
		new add_option("SFX", types.slider, global.option_sfx_volume * 100,
			function(_val) {
				_val /= 100
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
	[ //4 keyboard
		new add_option_back(),
		new add_option("KEYBOARD", types.func, undefined,
			function(_val) {
				instance_create(x, y, obj_keyconfig)
			}),
		new add_option("CONTROLLER",		types.change, 64),
		new add_option("RESET CONFIG",		types.change, 64)
	],
	[ //5 video mode, val is in order of this list
		new add_option_back(2),
		new add_option("WINDOWED",		types.func,	0,	func_windowmode),
		new add_option("FULLSCREEN",	types.func,	1,	func_windowmode),
		new add_option("BORDERLESS",	types.func,	2,	func_windowmode)
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

//i could reduce the amount of new functions made here actually,,,, maybe tdp was right to have seperate functions for each type