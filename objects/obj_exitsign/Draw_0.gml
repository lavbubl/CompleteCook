if pal_select == 12
	pattern_draw(sprite_index, image_index, x, y, pattern_spr, image_xscale, image_yscale, image_angle, image_blend, image_alpha)

pal_swap_set(pal_peppino, pal_select, false)
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
pal_swap_reset()
