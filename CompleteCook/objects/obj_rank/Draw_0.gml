if (brownfade < 1)
{
	shader_set(global.Pal_Shader)
	if (global.collect >= global.collectN)
		pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false)
	if (global.collectN > global.collect)
		pal_swap_set(obj_player2.spr_palette, obj_player2.paletteselect, false)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
	shader_reset()
}
if (brown)
{
	draw_set_alpha(brownfade)
	shader_set(shd_rank)
	draw_rectangle_color(0, 0, 960, 540, c_white, c_white, c_white, c_white, false)
	draw_self()
	shader_reset()
	draw_set_alpha(1)
}
draw_set_halign(fa_left)
draw_set_valign(fa_top)
for (var i = 0; i < array_length(text); i++)
{
	var b = text[i]
	if (b[0])
		draw_text_color(48, 48 + (32 * i), b[1], c_white, c_white, c_white, c_white, 1)
}