function scr_destroy_destructibles(xplus, yplus)
{
	var _num = instance_place_list(x + xplus, y + yplus, obj_destructibles, global.instancelist, 0)
	if _num > 0
	{
		for (var i = 0; i < ds_list_size(global.instancelist); i++)
			instance_destroy(ds_list_find_value(global.instancelist, i))
		ds_list_clear(global.instancelist)
	}
}
