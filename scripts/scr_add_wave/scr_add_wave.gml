function scr_add_wave(argument0, argument1, argument2, argument3, argument4)
{
	var _wave = argument0
	var _enemynumber = argument1
	var _obj = argument2
	var _random = argument3
	var _spawnpoint = argument4
	baddie_arr[_wave][_enemynumber] = _obj
	baddie_random[_wave][_enemynumber] = _random
	if (!_random)
		baddie_spawnpoint[_wave][_enemynumber] = _spawnpoint
	exit;
}

