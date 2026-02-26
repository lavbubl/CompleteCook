if obj_player.pal_select == 12
	pattern_draw(sprite_index, image_index, x, y, obj_player.pattern_spr, image_xscale, image_yscale, image_angle, image_blend, image_alpha)

if sprite_index = spr_pizzaportalentrancestart
	pal_swap_set(pal_peppino, obj_player.pal_select, false)

draw_self()

if shader_current() != -1
	shader_reset()
