draw_sprite(sprite_index, image_index, 0, 0)

if state == 1
{
	if obj_player.pal_select == 12 || obj_player.pal_select >= 20
		pattern_draw(techdiff_spr, t_ix, 300, 352, obj_player.pattern_spr, obj_player.pattern_colors)
	pal_swap_set(obj_player.pal_spr, obj_player.pal_select, false)
	draw_sprite(techdiff_spr, t_ix, 300, 352)
	pal_swap_reset()
}
