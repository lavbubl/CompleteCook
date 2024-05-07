function cutscene_move_actor(argument0, argument1, argument2, argument3)
{
	var _obj = argument0
	var xx = argument1
	var yy = argument2
	var interp = argument3
	var finish = 0
	with (_obj)
	{
		x = lerp(x, xx, interp)
		y = lerp(y, yy, interp)
		if (x > (xx - 6) && x < (xx + 6) && y > (yy - 6) && y < (yy + 6))
			finish = 1
	}
	if finish
		cutscene_end_action()
	exit;
}

