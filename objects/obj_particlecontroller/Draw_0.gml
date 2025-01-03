for (var p = 0; p < ds_list_size(particle_list); p++) 
{
	var p_id = ds_list_find_value(particle_list, p)
	with (p_id)
	{
		draw_sprite(sprite_index, image_index, x, y)
	}
}