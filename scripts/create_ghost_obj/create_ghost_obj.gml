function create_ghost_obj()
{
	var _id = instance_create(x, y, obj_ghostvisual)
	with _id
	{
		sprite_index = other.sprite_index
		image_speed = other.image_speed
	}
	return _id;
}
