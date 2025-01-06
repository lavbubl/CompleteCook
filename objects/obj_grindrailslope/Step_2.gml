var slope = image_yscale / image_xscale

if (image_xscale > 0)
{
	side = obj_player.bbox_right
	prevside = obj_player.bbox_right - obj_player.hsp
	slope_y = max(bbox_bottom + ((side - bbox_left) * slope), bbox_top)
	prevslope_y = bbox_bottom + ((side - bbox_right) * slope)
}
else
{
	side = obj_player.bbox_left
	prevside = obj_player.bbox_left - obj_player.hsp
	slope_y = max(bbox_bottom - ((side - bbox_right) * slope), bbox_top)
	prevslope_y = bbox_bottom - ((side - bbox_right) * slope)
}

with (obj_player)
{
	var h = bbox_bottom - y
	var spd = y - yprevious
	if (place_meeting(x, y + 1, other) && bbox_bottom - vsp <= other.prevslope_y + abs(hsp) && bbox_bottom + vsp >= other.slope_y)
	{
		vsp = 0
		state = states.grind
		y = other.slope_y - h
	}
}