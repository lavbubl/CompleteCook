for (var inst = 0; inst < array_length(aftimg_list); inst++) 
{
	var inst_id = aftimg_list[inst]
	
	with (inst_id)
	{
		switch (effect)
		{
			/*case after_images.blur:
				shader_set(shd_blur)
				quick_shader_set_uniform_f(shd_blur, "h", abs(hsp) >= abs(vsp))
				break;*/
			case after_images.solid_color:
				shader_set(shd_solidcolor)
				quick_shader_set_uniform_f(shd_solidcolor, "red", r)
				quick_shader_set_uniform_f(shd_solidcolor, "green", g)
				quick_shader_set_uniform_f(shd_solidcolor, "blue", b)
				break;
		}
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
	}
	if (shader_current() != -1) // dont know if this works both with a noone and -1 but im gonna be safe
		shader_reset()
}
