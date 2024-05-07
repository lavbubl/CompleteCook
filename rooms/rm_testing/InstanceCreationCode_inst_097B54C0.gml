func = function(argument0)
{
	if ((!active) && argument0.state == states.handstandjump)
	{
		active = 1
		obj_secretmanager.hittriggers++
		with (argument0)
			scr_pummel()
	}
	exit;
}

