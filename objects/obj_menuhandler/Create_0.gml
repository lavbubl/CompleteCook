tvs =  [new ini_menu_tv_inst(64, 0, 
			spr_menutv1_off,
			spr_menutv1_whitenoise,
			spr_menutv1_selected,
			spr_menutv1_confirm, "1"),
		new ini_menu_tv_inst(448, 64, 
			spr_menutv2_off,
			spr_menutv2_whitenoise,
			spr_menutv2_selected,
			spr_menutv2_confirm, "2"),
		new ini_menu_tv_inst(704, 160, 
			spr_menutv3_off,
			spr_menutv3_whitenoise,
			spr_menutv3_selected,
			spr_menutv3_confirm, "3"),]

for (var i = 0; i < array_length(tvs); i++) 
{
	with tvs[i]
	{
		pattern_init()
		ini_open($"saves/saveData{filename}.ini")
		pal_ix = ini_read_real("Clothes", "palette_index", 1)
		pat_spr = ini_read_real("Clothes", "pattern_sprite", noone)
		ini_close()
	}
}

cur_selected = 1
state = 0
	
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
	pal_ix = 0
	pat_spr = noone
}

depth = -100
