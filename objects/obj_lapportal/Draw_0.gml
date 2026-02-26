if sprite_index == spr_pizzaportalend
{
	if obj_player.pal_select == 12
		pattern_draw(sprite_index, image_index, x, y, obj_player.pattern_spr, image_xscale, image_yscale, image_angle, image_blend, image_alpha)

	pal_swap_set(pal_peppino, obj_player.pal_select, false)
	draw_self()
	shader_reset()
}
else if sprite_index == spr_pizzaportal_outline
	draw_sprite_ext(sprite_index, image_index, x, y + wave(-2, 2, 1, 5), image_xscale, image_yscale, image_angle, image_blend, 0.5)
else
{
	draw_self()
	draw_sprite(spr_lap2warning, 0, x, y + wave(-5, 5, 0.5, 5))
}