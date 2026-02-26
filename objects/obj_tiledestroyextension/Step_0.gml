var _blockarr = [obj_destroyable_secret, obj_destroyable_big_secret, obj_metalblock_secret]

if !place_meeting(x - 1, y - 1, _blockarr) && !place_meeting(x + 1, y + 1, _blockarr)
{
	instance_destroy()
	
	with obj_cutoff
	{
		if place_meeting(x, y, other)
			visible = true
	}
	tile_layer_delete_at(bbox_left, bbox_top)
	
	if makecracks
	{
		var c = instance_create(bbox_left, bbox_bottom, obj_cutoff)
		c.image_yscale = -1
		c.image_angle = 90
		instance_create(bbox_left, bbox_top, obj_cutoff).image_yscale = -1
		instance_create(bbox_right, bbox_bottom, obj_cutoff).image_angle = 90
		instance_create(bbox_left, bbox_bottom, obj_cutoff)
	}
}
