if ((!active) && (!instance_exists(obj_frontcanongoblin)))
{
	active = 1
	start = 1
	instance_create(x, y, obj_frontcanongoblin)
	with (obj_frontcanongoblin_trigger)
		active = 1
}
