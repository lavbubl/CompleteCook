if (sprite_index != spr_pizzaportal && sprite_index != spr_pizzaportal_outline)
{
	shader_set(global.Pal_Shader)
	pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false)
	draw_self()
	shader_reset()
}
else if (sprite_index == spr_pizzaportal_outline)
	draw_sprite_ext(sprite_index, image_index, x, y + Wave(-2, 2, 1, 5), image_xscale, image_yscale, image_angle, image_blend, image_alpha)
else
{
	draw_self()
	draw_sprite(spr_lap2warning, 0, x, y + Wave(-5, 5, 0.5, 5))
}
