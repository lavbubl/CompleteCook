draw_sprite(spr_lang_flags, selected, mid_x, mid_y + wave(-2, 2, 2, 10))

draw_sprite(spr_lang_left, 0, left_arrow_x, mid_y)
draw_sprite(spr_lang_right, 0, right_arrow_x, mid_y)

left_arrow_x = approach(left_arrow_x, left_arrow_xstart, 1)
right_arrow_x = approach(right_arrow_x, right_arrow_xstart, 1)

draw_set_font(global.generic_font)
draw_set_align(fa_center, fa_top)
draw_reset_color()

draw_text(mid_x, mid_y + 80 + floor(wave(-1, 1, 0.5, 0)), languages_array[selected][1])

if loading
{
	draw_set_color(c_black)
	draw_set_alpha(0.5)

	draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false)

	draw_reset_color(1)
	draw_text(mid_x, mid_y, text_menu_loading)
}
