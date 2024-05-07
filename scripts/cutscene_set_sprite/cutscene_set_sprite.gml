function cutscene_set_sprite(argument0, argument1, argument2, argument3)
{
	var _obj = argument0
	var _spr = argument1
	var _spd = argument2
	var _xscale = argument3
	with (_obj)
	{
		sprite_index = _spr
		image_speed = _spd
		image_xscale = _xscale
		image_index = 0
		xscale = _xscale
	}
	cutscene_end_action()
	exit;
}

