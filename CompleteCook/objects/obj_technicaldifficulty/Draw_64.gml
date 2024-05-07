if (use_static)
	draw_sprite(spr_tvstatic, static_index, 0, 0);
else
{
	shader_set(global.Pal_Shader)
	draw_sprite(spr_technicaldifficulty_bg, 0, 0, 0)
	pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false)
	draw_sprite(sprite, 0, 300, 352)
	shader_reset()
}
