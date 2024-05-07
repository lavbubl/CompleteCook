function cutscene_image_index(argument0, argument1)
{
	var _obj = argument0
	var _index = argument1
	with (_obj)
		image_index = _index
	cutscene_end_action()
	exit;
}

