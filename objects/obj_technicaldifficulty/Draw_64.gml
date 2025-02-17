draw_self()

if (state == 1)
{
	shader_set(shd_pal_swapper)
	pal_swap_set(pal_peppino, obj_player.pal_select, false)
	draw_sprite(spr_techdiff, t_ix, 300, 350)
	pal_swap_reset()
	shader_reset()
}
