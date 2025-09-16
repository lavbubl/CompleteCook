if !info_visible
	exit;

draw_set_font(-4)
draw_set_align(fa_left, fa_bottom)

draw_set_alpha(0.5)
draw_set_color(c_black)
draw_rectangle(0, screen_h - 80, 300, screen_h, false)

draw_reset_color()

draw_text(0, screen_h, $"fps: {fps}")
draw_text(0, screen_h - 20, $"fps_real: {floor(fps_real)}")
draw_text(0, screen_h - 40, "F1: Reset position")
draw_text(0, screen_h - 60, "Shift + 9: Restart game")

var ver_str = $"Complete Cook {version}" 

draw_set_halign(fa_right)
draw_set_alpha(0.5)
draw_set_color(c_black)
draw_rectangle(screen_w - string_width(ver_str) - 4, screen_h - string_height(ver_str), screen_w, screen_h, false)

draw_reset_color()

draw_text(screen_w - 2, screen_h, ver_str)
