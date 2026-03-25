if (p_ix == 12 && p_spr != noone)
	pattern_draw(sprite_index, image_index, x, y, p_spr, obj_player.pattern_colors)
	
pal_swap_set(obj_player.pal_spr, p_ix, false)
draw_self()
shader_reset()

draw_set_colour(c_red)
