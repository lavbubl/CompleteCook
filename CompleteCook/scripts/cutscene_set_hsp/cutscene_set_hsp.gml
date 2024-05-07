function cutscene_set_hsp(argument0, argument1)
{
	var _obj = argument0
	var _hsp = argument1
	with (_obj)
		hsp = _hsp
	cutscene_end_action()
	exit;
}

function cutscene_set_vsp(argument0, argument1)
{
	with (argument0)
		vsp = argument1
	cutscene_end_action()
	exit;
}

