for (var i = 0; i < instance_number(par_collision); i++) 
{
	var _id = instance_find(par_collision, i)
	switch (_id.object_index)
	{
		case obj_solid:
		case obj_destroyable_secret:
		case obj_destroyable_big_secret:
		case obj_metalblock_secret:
		case obj_platform:
		case obj_sideplatform:
		case obj_slope:
		case obj_slopeplatform:
			_id.visible = global.showcollisions
			break;
	}
}

if instance_exists(obj_doorpoint)
	obj_doorpoint.visible = global.showcollisions
