for (var p = 0; p < ds_list_size(particle_list); p++)
{
	var p_id = ds_list_find_value(particle_list, p)
	with (p_id)
	{
		image_index += image_speed
		switch (type)
		{
			case particles.gib:
				x += hsp
				y += vsp
				vsp += 0.5
				if y > room_height
					ds_list_delete(other.particle_list, p)
			default:
				if anim_ended()
					ds_list_delete(other.particle_list, p)
				break;
		}
	}
}
