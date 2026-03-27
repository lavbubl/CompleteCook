for (var inst = 0; inst < array_length(aftimg_list); inst++) 
{
	var inst_id = aftimg_list[inst]
	
	with (inst_id)
	{
		switch (effect)
		{
			case after_images.blur:
				if obj_player.pal_select == 12 || obj_player.pal_select >= 20
					pattern_draw(sprite_index, image_index, x, y, obj_player.pattern_spr, obj_player.pattern_colors, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
				pal_swap_set(obj_player.pal_spr, obj_player.pal_select, false)
				break;
			case after_images.solid_color:
				shader_set(shd_solidcolor)
				quick_shader_set_uniform_f(shd_solidcolor, "red", r / 255)
				quick_shader_set_uniform_f(shd_solidcolor, "green", g / 255)
				quick_shader_set_uniform_f(shd_solidcolor, "blue", b / 255)
				break;
			case after_images.noise:
				shader_set(shd_afterimage_noise)
				if obj_player.pal_select == 12 || obj_player.pal_select >= 20
				{
					quick_shader_set_uniform_f(shd_afterimage_noise, "pixel_x", 0)
					quick_shader_set_uniform_f(shd_afterimage_noise, "pixel_y", 0)
					texture_set_stage(shader_get_sampler_index(shd_afterimage_noise, "color_source"), sprite_get_texture(obj_player.pattern_spr, 0));
				}
				else
				{
					var _pal = obj_player.pal_spr
					var _tex = sprite_get_texture(_pal, 0)
					if obj_player.pal_select >= 12
						quick_shader_set_uniform_f(shd_afterimage_noise, "pixel_x", (obj_player.pal_select) / sprite_get_width(_pal))
					else
						quick_shader_set_uniform_f(shd_afterimage_noise, "pixel_x", (obj_player.pal_select + 1) / sprite_get_width(_pal))
					quick_shader_set_uniform_f(shd_afterimage_noise, "pixel_y", 1 / sprite_get_height(_pal))
					texture_set_stage(shader_get_sampler_index(shd_afterimage_noise, "color_source"), _tex);
				}
				break;
		}
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
	}
	if shader_current() != -1
		shader_reset()
}
