depth = -1000
level_timer = 0
file_timer = 0

function string_convert_seconds_to_timer(_num, _hundreth = false)
{
	var _ms = string(floor((_num % 1) * (_hundreth ? 100 : 10)))
	var _s = string(floor(_num % 60))
	var _m = string(floor((_num / 60) % 60))
	var _h = string(floor(_num / 3600))
	
	if _hundreth && string_length(_ms) <= 1
		_ms = "0" + _ms
	if string_length(_s) <= 1
		_s = "0" + _s
	if string_length(_m) <= 1
		_m = "0" + _m
	if string_length(_h) <= 1
		_h = "0" + _h
	
	return _h + ":" + _m + ":" + _s + "." + _ms; //00:00:00.0 h:m:s:ms
}
