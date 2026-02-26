if state != 0
{
	draw_sprite(spr_titlecards, card_index, 0, 0)
	draw_sprite(spr_titlecard_titles, title_index, irandom_range(-1, 1), irandom_range(-1, 1))
}

draw_set_color(c_black)
draw_set_alpha(fade_alpha)
draw_rectangle(0, 0, screen_w, screen_h, false)
draw_reset_color()
