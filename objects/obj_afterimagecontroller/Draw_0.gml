for (var inst = 0; inst < ds_list_size(aftimg_list); inst++) 
{
	var inst_id = ds_list_find_value(aftimg_list, inst)
	
	with (inst_id)
	{
		switch (effect)
		{
			case after_images.blur:
				shader_set(shd_blur)
				quick_shader_set_uniform_f(shd_blur, "h", abs(hsp) >= abs(vsp))
				break;
		}
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
	}
	if (shader_current() != -1)
		shader_reset()
}
