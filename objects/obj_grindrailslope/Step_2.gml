var slope = image_yscale / image_xscale

if (image_xscale > 0)
{
	side = obj_player.bbox_right
	prevside = obj_player.xprevious + (obj_player.x - obj_player.bbox_right)
	slope_y = max(bbox_bottom + ((side - bbox_left) * slope), bbox_top)
	prevslope_y = bbox_bottom + ((side - bbox_right) * slope)
}
else
{
	side = obj_player.bbox_left
	prevside = obj_player.xprevious + (obj_player.x - obj_player.bbox_left)
	slope_y = max(bbox_bottom - ((side - bbox_right) * slope), bbox_top)
	prevslope_y = bbox_bottom + ((side - bbox_right) * slope)
}

with (obj_player)
{
	var h = bbox_bottom - y
	var spd = y - yprevious
	if place_meeting(x, y + 1, other)
	{
		vsp = 0
		state = states.grind
		y = other.slope_y - h
	}
}