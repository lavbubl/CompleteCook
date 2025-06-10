// declare input
input =
{
	left: new Input([global.keybinds.ui_left]),
	right: new Input([global.keybinds.ui_right]),
	accept: new Input([global.keybinds.ui_accept])
};

tvs =  [new ini_menu_tv_inst(103, 0, 
			spr_menutv1_off,
			spr_menutv1_whitenoise,
			spr_menutv1_selected,
			spr_menutv1_confirm, "1"),
		new ini_menu_tv_inst(493, 70, 
			spr_menutv2_off,
			spr_menutv2_whitenoise,
			spr_menutv2_selected,
			spr_menutv2_confirm, "2"),
		new ini_menu_tv_inst(699, 166, 
			spr_menutv3_off,
			spr_menutv3_whitenoise,
			spr_menutv3_selected,
			spr_menutv3_confirm, "3")]

for (var i = 0; i < array_length(tvs); i++) 
{
	with tvs[i]
	{
		pattern_init()
		var ini_str = $"saves/saveData{filename}.ini"
		if file_exists(ini_str)
		{
			save_exists = true
			ini_open(ini_str)
			pal_ix = ini_read_real("Clothes", "palette_index", 1)
			pat_spr = ini_read_real("Clothes", "pattern_sprite", pat_pizza)
			ini_close()
		}
	}
}

static_snd = scr_sound(sfx_menustatic, true)
audio_sound_gain(static_snd, 0, 0)

mu = scr_sound(mu_mainmenu, true)
audio_sound_loop_end(mu, 4.76)

cur_selected = 1
state = 0
menu_dark = true
dark_state = 0
	
function ini_menu_tv_inst(_x, _y, _sproff, _sprnoise, _sprselect, _sprconfirm, _filename) constructor
{
	x = _x
    y = _y
    filename = _filename
	sprs = {
		off: _sproff,
		whitenoise: _sprnoise,
		selected: _sprselect,
		confirm: _sprconfirm
	}
	state = 0
	sprite_index = _sproff
	image_index = 0
	buffer = 30
	pal_ix = 1
	pat_spr = noone
	save_exists = false
}

depth = -100
