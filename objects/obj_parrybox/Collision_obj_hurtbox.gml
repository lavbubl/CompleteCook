if other.inactive
	exit;

with other
{
	var xh = lerp(bbox_left, bbox_right, 0.5)
	obj_player.xscale = obj_player.x < xh ? 1 : -1
	
	if object_index == obj_pizzardelectricity
	{
		image_xscale *= -1
		hurtplayer = false
	}
}

event_user(0)
