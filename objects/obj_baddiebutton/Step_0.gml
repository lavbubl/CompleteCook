active = place_meeting(x, y, obj_baddie)
if (active != preactive)
{
	var _alreadyactive = 0
	with (obj_baddiebutton)
	{
		if (id != other.id && trigger == other.trigger)
		{
			if active
				_alreadyactive = 1
		}
	}
	with (obj_baddiegate)
	{
		if (trigger == other.trigger && (!((active && _alreadyactive))))
			active = (!active)
	}
	preactive = active
}
image_index = active
