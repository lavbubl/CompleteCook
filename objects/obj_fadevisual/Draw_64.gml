if image_alpha > 0
{
	draw_set_color(c_black)
	draw_set_alpha(image_alpha)
	draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false)
	draw_reset_color()
}
