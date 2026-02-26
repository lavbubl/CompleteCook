if image_alpha > 0
{
	draw_set_color(c_black)
	draw_set_alpha(image_alpha)
	draw_rectangle(0, 0, screen_w, screen_h, false)
	draw_reset_color()
}