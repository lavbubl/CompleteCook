if obj_player.pal_select == 12 || obj_player.pal_select >= 20
	pattern_draw(sprite_index, image_index, x, y, obj_player.pattern_spr, obj_player.pattern_colors, image_xscale, image_yscale, image_angle, image_blend, image_alpha)

if sprite_index = spr_pizzaportalentrancestart
	pal_swap_set(obj_player.pal_spr, obj_player.pal_select, false)

draw_self()

if shader_current() != -1
	shader_reset()
