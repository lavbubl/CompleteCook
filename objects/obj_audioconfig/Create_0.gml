audio_select = 0
audiosaved_master = (global.option_master_volume * 100)
audiosaved_music = (global.option_music_volume * 100)
audiosaved_sfx = (global.option_sfx_volume * 100)
selecting = -1
player = 0
stickpressed = 0
key_buffer = 0
key_max = 5
updown_buffer = 0
updown_max = 10
depth = -100
function set_audio_volume()
{
	global.option_master_volume = (audiosaved_master / 100)
	global.option_music_volume = (audiosaved_music / 100)
	global.option_sfx_volume = (audiosaved_sfx / 100)
	audio_sound_gain(mu_pause, (audiosaved_music * 0.8) / 100, 0)
	set_master_gain(global.option_master_volume)
}
function set_audio_config()
{
	ini_open("saveData.ini")
	ini_write_real("Option", "master_volume", global.option_master_volume)
	ini_write_real("Option", "music_volume", global.option_music_volume)
	ini_write_real("Option", "sfx_volume", global.option_sfx_volume)
	ini_close()
	exit;
}
function draw_slider(_x, _y, _value, _select)
{
	var _os = audio_select
	draw_sprite_ext(spr_slider, 0, _x, _y, 1, 1, 0, c_white, (_os == _select ? 1 : 0.5))
	var aw = 200 * (_value / 100)
	var _x2 = _x + aw
	draw_sprite(spr_slidericon, (_os == _select && (-key_left || key_right)) ? 1 : 0, _x2, _y)
}
