for (var p = 0; p < ds_list_size(particle_list); p++)
{
	var p_id = ds_list_find_value(particle_list, p)
	with (p_id)
	{
		image_index += image_speed
		if anim_ended()
			ds_list_delete(other.particle_list, p)
	}
}
