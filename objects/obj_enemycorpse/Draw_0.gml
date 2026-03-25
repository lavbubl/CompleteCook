if dopalette
{
	if (pal_select == 12 || obj_player.pal_select >= 20) && string_starts_with(sprite_get_name(sprite_index), "spr_palettedresserdebris")
		pattern_draw(sprite_index, image_index, x, y, pattern_spr, obj_player.pattern_colors, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
	
	pal_swap_set(obj_player.pal_spr, pal_select, false)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
	pal_swap_reset()
}
else
	draw_self()
