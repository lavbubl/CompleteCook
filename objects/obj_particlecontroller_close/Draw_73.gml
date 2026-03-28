for (var i = 0; i < array_length(postdraw_list); i++) 
{
	var p_id = postdraw_list[i]
	with p_id
	{
		if type != particles.genericpoof || image_index < image_number
		{
			if type == particles.noisebump || sprite_index == spr_drilldebris
			{
				if obj_player.pal_select == 12 || obj_player.pal_select >= 20
					pattern_draw(sprite_index, image_index, x, y, obj_player.pattern_spr, obj_player.pattern_colors, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
				
				pal_swap_set(obj_player.pal_spr, obj_player.pal_select, false)
				draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
				pal_swap_reset()
			}
			else
				draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
		}
		image_index += image_speed
	}
}
