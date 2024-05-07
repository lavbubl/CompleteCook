if (!active)
{
	var _sign_id = id
	with (obj_piraneapple_spawn)
	{
		if (trigger == other.trigger)
		{
			with (instance_create(x, y, obj_piraneapple))
			{
				state = states.transitioncutscene
				sign_id = _sign_id
			}
		}
	}
	active = 1
}
