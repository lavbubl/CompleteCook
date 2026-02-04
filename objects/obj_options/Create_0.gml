// declare input
ui_input =
{
	left: new Input(global.keybinds.ui_left),
	right: new Input(global.keybinds.ui_right),
	up: new Input(global.keybinds.ui_up),
	down: new Input(global.keybinds.ui_down),
	accept: new Input(global.keybinds.ui_accept),
	deny: new Input(global.keybinds.ui_deny)
};

depth = -2000

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
		prev_mode = global.windowmode
		change = _mode != global.windowmode
		global.windowmode = _mode
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
		new add_option("MASTER", types.slider, global.master_volume * 100,	
			function(_val) {
				_val /= 100
				global.master_volume = _val
				quick_ini_write_real("globalsave.ini", "options", "master_volume", _val)
			}),
		new add_option("MUSIC", types.slider, global.music_volume * 100,	
			function(_val) {
				_val /= 100
				global.music_volume = _val
				audio_group_set_gain(ag_music, _val, 0)
				quick_ini_write_real("globalsave.ini", "options", "music_volume", _val)
			}),
		new add_option("SFX", types.slider, global.sfx_volume * 100,
			function(_val) {
				_val /= 100
				global.sfx_volume = _val
				audio_group_set_gain(ag_sfx, _val, 0)
				quick_ini_write_real("globalsave.ini", "options", "sfx_volume", _val)
			}),
		new add_option("UNFOCUSED MUTE", types.onoff, global.unfocus_mute, 
			function(_val) {
				global.unfocus_mute = _val
				quick_ini_write_real("globalsave.ini", "options", "unfocus_mute", _val)
			})
	],
	[ //2 video
		new add_option_back(),
		new add_option("WINDOW MODE", types.change, 5),
		new add_option("RESOLUTION", types.multichoice, [global.chosen_res, global.res_strings],	
			function(_val) {
				global.chosen_res = _val[0]
				var _split = string_split(_val[1][global.chosen_res], "X")
				
				window_set_size(real(_split[0]), real(_split[1]))
				window_center()
				quick_ini_write_real("globalsave.ini", "options", "chosen_res", global.chosen_res)
			}),
		new add_option("VSYNC", types.onoff, global.vsync,
			function(_val) {
				global.vsync = _val
				display_reset(0, _val)
				quick_ini_write_real("globalsave.ini", "options", "vsync", _val)
			}),
		new add_option("TEXTURE FILTERING", types.onoff, global.texturefilter,
			function(_val) {
				global.texturefilter = _val
				quick_ini_write_real("globalsave.ini", "options", "texturefilter", _val)
			}),
		new add_option("SHOW HUD", types.onoff, global.showhud,
			function(_val) {
				global.showhud = _val
				quick_ini_write_real("globalsave.ini", "options", "showhud", _val)
			})
	],
	[ //3 game
		new add_option_back(),
		new add_option("LANGUAGE",			types.change, 64),
		new add_option("RUMBLE",			types.change, 64),
		new add_option("SCREEN SHAKE",		types.change, 64),
		new add_option("TIMER",				types.change, 64),
		new add_option("TIMER TYPE",		types.change, 64),
		new add_option("SPEEDRUN TIMER",	types.change, 64),
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

scr_sound(choose(sfx_ui_accept1, sfx_ui_accept2, sfx_ui_accept3))
//i could reduce the amount of new functions made here actually,,,, maybe tdp was right to have seperate functions for each type