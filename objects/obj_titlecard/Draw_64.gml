if (fadedin)
{
	draw_self()
	draw_sprite(spr_titlecard_titles, titleix, 0 + irandom_range(-1, 1), 0 + irandom_range(-1, 1))
}
draw_set_alpha(fadealpha)
draw_rectangle_color(0, 0, 960, 540, c_black, c_black, c_black, c_black, false)
draw_set_alpha(1)
