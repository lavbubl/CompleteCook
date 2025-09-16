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

optiontypes = {
	slider: 0,
	onoff: 1,
	input: 2,
	multichoice: 3
}

ini_open("globalsave.ini")
global.unfocus_mute = ini_read_real("options", "unfocus_mute", true)
global.fullscreen = ini_read_real("options", "fullscreen", false)
global.master_volume = ini_read_real("options", "master_volume", false)
global.sfx_volume = ini_read_real("options", "sfx_volume", 1)
global.music_volume = ini_read_real("options", "music_volume", 1) //these being global are kinda unneccesary... //ok so WHY did you make them global then???
global.chosen_res = ini_read_real("options", "res_number", 1)
ini_close()

options = [
	{o_name: "FULLSCREEN: ", val: global.fullscreen, o_type: optiontypes.onoff, func: function(_val) {
		global.fullscreen = _val
		quick_ini_write_real("globalsave.ini", "options", "fullscreen", _val)
		window_set_fullscreen(_val)
		if (!_val)
			window_center()
	}}, //reals grabbed from strings split by an x instead of just doing a special drawing function for this option. real genius :)
	{o_name: "SCREEN SIZE: ", choices: ["480X270", "960X540", "1920X1080"], val: global.chosen_res, o_type: optiontypes.multichoice, func: function(_val, _arr_val) {
		var str_arr = string_split(_arr_val, "X")
		window_set_size(real(str_arr[0]), real(str_arr[1]))
		window_center()
		quick_ini_write_real("globalsave.ini", "options", "res_number", _val)
	}},
	{o_name: "MASTER VOLUME: ", val: global.master_volume * 100, o_type: optiontypes.slider, func: function(_val) {
		_val /= 100
		global.master_volume = _val
		quick_ini_write_real("globalsave.ini", "options", "master_volume", _val)
	}},
	{o_name: "SFX VOLUME: ", val: global.sfx_volume * 100, o_type: optiontypes.slider, func: function(_val) {
		_val /= 100
		global.sfx_volume = _val
		audio_group_set_gain(ag_sfx, _val, 0)
		quick_ini_write_real("globalsave.ini", "options", "sfx_volume", _val)
	}},
	{o_name: "MUSIC VOLUME: ", val: global.music_volume * 100, o_type: optiontypes.slider, func: function(_val) {
		_val /= 100
		global.music_volume = _val
		audio_group_set_gain(ag_music, _val, 0)
		quick_ini_write_real("globalsave.ini", "options", "music_volume", _val)
	}},
	{o_name: "UNFOCUSED MUTE: ", val: global.unfocus_mute, o_type: optiontypes.onoff, func: function(_val) {
		global.unfocus_mute = _val
		quick_ini_write_real("globalsave.ini", "options", "unfocus_mute", _val)
	}},
	{o_name: "CHANGE KEYBINDS", val: "", o_type: optiontypes.input, func: function(_val) {
		instance_create(0, 0, obj_keyconfig)
	}}
]
