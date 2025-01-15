var slope = image_yscale / image_xscale

if (image_xscale > 0)
{
	side = obj_player.bbox_right
	prevside = obj_player.old_x2 + (obj_player.bbox_right - obj_player.x)
	slope_y = clamp(bbox_bottom - ((side - bbox_left) * slope), bbox_top, bbox_bottom)
	prevslope_y = max(bbox_bottom - ((prevside - bbox_left) * slope), bbox_top)
}
else
{
	side = obj_player.bbox_left
	prevside = obj_player.old_x2 + (obj_player.bbox_left - obj_player.x)
	slope_y = clamp(bbox_bottom - ((side - bbox_right) * slope), bbox_top, bbox_bottom)
	prevslope_y = max(bbox_bottom - ((prevside - bbox_right) * slope), bbox_top)
}

with (obj_player)
{
	var h = bbox_bottom - y
	var spd = vsp
	var _hsp = other.image_xscale > 0 ? min(hsp, 0) : max(hsp, 0)
	if (place_meeting(x - _hsp, y + min(slope * 20, h), other) && bbox_bottom >= other.slope_y - abs(_hsp) - (slope * 20))
	{
		vsp = 0
		state = states.grind
		y = other.slope_y - h
	}
}