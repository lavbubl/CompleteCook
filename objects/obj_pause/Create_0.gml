create_image = false
pause = false
pause_image = spr_null
optionselected = 0

enum optiontypes {
	slider,
	onoff
}

ini_open("globalsave.ini")
global.fullscreen = ini_read_real("options", "fullscreen", false)
global.master_volume = ini_read_real("options", "master_volume", false)
global.sfx_volume = ini_read_real("options", "sfx_volume", 1)
global.music_volume = ini_read_real("options", "music_volume", 1) //these being global are kinda unneccesary...
ini_close()

options = [
	{o_name: "FULLSCREEN: ", val: global.fullscreen, o_type: optiontypes.onoff, func: function(_val) {
		global.fullscreen = _val
		quick_ini_write_real("globalsave.ini", "options", "fullscreen", _val)
		window_set_fullscreen(_val)
		if (!_val)
			window_center()
		}},
	{o_name: "MASTER VOLUME: ", val: global.master_volume * 100, o_type: optiontypes.slider, func: function(_val) {
		_val /= 100
		global.master_volume = _val
		quick_ini_write_real("globalsave.ini", "options", "master_volume", _val)
		audio_master_gain(_val)
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
		}}
]

window_set_fullscreen(global.fullscreen)
audio_master_gain(global.master_volume)
audio_group_set_gain(ag_sfx, global.sfx_volume, 0)
audio_group_set_gain(ag_music, global.music_volume, 0)
