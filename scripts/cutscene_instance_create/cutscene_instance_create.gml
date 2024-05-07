function cutscene_instance_create(argument0, argument1, argument2, argument3)
{
	var _obj = argument0
	var xx = argument1
	var yy = argument2
	var _xscale = argument3
	with (instance_create(xx, yy, _obj))
	{
		depth = other.depth
		image_xscale = _xscale
		xscale = _xscale
	}
	cutscene_end_action()
	exit;
}

