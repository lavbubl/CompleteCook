if state != 0
{
	draw_sprite(spr_titlecards, card_index, 0, 0)
	draw_sprite(spr_titlecard_titles, title_index, irandom_range(-1, 1), irandom_range(-1, 1))
}

draw_set_color(c_black)
draw_set_alpha(fade_alpha)
draw_rectangle(0, 0, screen_w, screen_h, false)
draw_reset_color()

if title_index == 1
{
	if pep_sticker_timer > 0
	{
		pep_sticker_timer--
		if pep_sticker_timer == 0
			scr_sound(sfx_pepsticker)
	}
	else
	{
		with pep_sticker
		{
			draw_sprite_ext(sprite_index, 0, x, y, size, size, 0, c_white, 1)
			size = approach(size, actual_size, 0.1)
		}
	}
}
