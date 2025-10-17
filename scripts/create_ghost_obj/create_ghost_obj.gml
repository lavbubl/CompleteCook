function create_ghost_obj()
{
	with instance_create(x, y, obj_ghostvisual)
	{
		sprite_index = other.sprite_index
		image_speed = other.image_speed
	}
}
