for (var i = 0; i < ds_list_size(global.col_obj_list); i++) 
{
	var _id = ds_list_find_value(global.col_obj_list, i)
	if instance_exists(_id)
	{
		switch (_id.object_index)
		{
			case obj_solid:
			case obj_platform:
			case obj_slope:
			case obj_slopeplatform:
				_id.visible = global.showcollisions
				break;
		}
	}
}

if instance_exists(obj_doorpoint)
	obj_doorpoint.visible = global.showcollisions
