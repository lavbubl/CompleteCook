draw_sprite(sprite_index, image_index, 0, 0)

if (state == 1)
{
	pattern_draw(spr_techdiff, t_ix, 300, 350, obj_player.pattern_spr)
	pal_swap_set(pal_peppino, obj_player.pal_select, false)
	draw_sprite(spr_techdiff, t_ix, 300, 350)
	pal_swap_reset()
}
