for (var i = 0; i < array_length(postdraw_list); i++) 
{
	var p_id = postdraw_list[i]
	with p_id
	{
		if type != particles.genericpoof || image_index < image_number //prevent error of first frames showing on this type of effect
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
		image_index += image_speed
	}
}
