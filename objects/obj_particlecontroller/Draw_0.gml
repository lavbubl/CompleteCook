for (var p = 0; p < ds_list_size(particle_list); p++) 
{
	var p_id = ds_list_find_value(particle_list, p)
	with (p_id)
	{
		other.depth = depth
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
	}
}