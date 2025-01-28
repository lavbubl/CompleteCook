if (pause)
{
	draw_set_color(c_black)
	draw_rectangle(0, 0, screen_w, screen_h, false)
	draw_sprite(pause_image, 0, 0, 0)
	
	draw_set_alpha(0.5)
	draw_rectangle(0, 0, screen_w, screen_h, false)
	draw_set_alpha(1)

	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_set_font(-1)
	
	var sw = screen_w / 2
	var sh = screen_h / 2

	draw_text(sw, sh, "PAUSE")
	
	draw_text(sw, sh + 20, $"FULLSCREEN: {global.fullscreen} | PRESS F")
	draw_text(sw, sh + 40, $"MUTE ALL: {global.mute_all} | PRESS M")
}
