with (obj_player)
{
	var h = bbox_bottom - y
	var spd = y - yprevious
	if (place_meeting(x, y + 1, other) && bbox_bottom - spd <= other.bbox_top + 1)
	{
		vsp = 0
		state = states.grind
		y = other.bbox_top - h
	}
}