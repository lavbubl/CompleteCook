func = function(argument0)
{
	if (active == 0 && argument0.state == states.backbreaker)
	{
		active = 1
		obj_secretmanager.touchedtriggers += 1
	}
	exit;
}

