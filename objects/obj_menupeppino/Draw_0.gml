if (p_ix == 12 && p_spr != noone)
	pattern_draw(sprite_index, image_index, x, y, p_spr)
	
pal_swap_set(pal_peppino, p_ix, false)
draw_self()
shader_reset()
