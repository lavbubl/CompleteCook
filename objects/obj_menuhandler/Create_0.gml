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

var _event_ref = fmod_studio_system_get_event("event:/music/menu")
mu = fmod_studio_event_description_create_instance(_event_ref)
fmod_studio_event_instance_start(mu)
fmod_studio_event_instance_release(mu)

var _event_ref = fmod_studio_system_get_event("event:/sfx/misc/menustatic")
static_snd = fmod_studio_event_description_create_instance(_event_ref)
fmod_studio_event_instance_start(static_snd)
fmod_studio_event_instance_release(static_snd)
fmod_studio_event_instance_set_volume(static_snd, 0)

cur_selected = 1
state = 0
menu_dark = true
dark_state = 0
optionsalpha = 0
buffer = 0

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

per = 0