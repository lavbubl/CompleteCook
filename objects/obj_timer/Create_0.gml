depth = -1000
level_timer = 0
file_timer = 0
special_font = font_add_sprite_ext(spr_smaller_font, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ!¡.:?¿1234567890ÁÄÃÀÂÉÈÊËÍÌÎÏÓÖÕÔÒÚÙÛÜÇ+", false, -3);

function string_convert_seconds_to_timer(_num)
{
	var _ms = string(floor((_num % 1) * 10))
	var _s = string(floor(_num % 60))
	var _m = string(floor((_num / 60) % 60))
	var _h = string(floor(_num / 3600))
	
	if string_length(_s) <= 1
		_s = "0" + _s
	if string_length(_m) <= 1
		_m = "0" + _m
	if string_length(_h) <= 1
		_h = "0" + _h
	
	return _h + ":" + _m + ":" + _s + "." + _ms; //00:00:00.0 h:m:s:ms
}
