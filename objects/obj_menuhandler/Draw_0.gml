for (var i = 0; i < array_length(tvs); i++) 
{
    var cur_tv = tvs[i]
	
	with cur_tv
	{
		if pal_ix == 12
			pattern_draw(sprite_index, image_index, x, y, pat_spr)
			
		pal_swap_set(pal_peppino, pal_ix, false)
		if sprite_index != noone
			draw_sprite(sprite_index, image_index, x, y)
		shader_reset()
															 //image_speed
		image_index = wrap(sprite_get_number(sprite_index), image_index + 0.35)
		draw_set_font(global.tutorialfont)
		draw_set_align(fa_center, fa_top, c_white)
		draw_text(x + (sprite_get_width(sprite_index) / 2), y + sprite_get_height(sprite_index), $"filename: {filename}")
	}
}
