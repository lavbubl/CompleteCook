if dopalette
{
	var ps = obj_player.pal_select
	if ps == 12
		pattern_draw(sprite_index, image_index, x, y, obj_player.pattern_spr, 1, 1, 0, c_white, 1)

	pal_swap_set(pal_peppino, ps, false)
	draw_self()
	pal_swap_reset()
}
else
	draw_self()
