if !info_visible
	exit;

draw_set_font(-4)
draw_set_align(fa_left, fa_bottom)

draw_set_alpha(0.5)
draw_set_color(c_black)
draw_rectangle(0, SCREEN_HEIGHT - 80, 300, SCREEN_HEIGHT, false)

draw_reset_color()

draw_text(0, SCREEN_HEIGHT, $"fps: {fps}")
draw_text(0, SCREEN_HEIGHT - 20, $"fps_real: {floor(fps_real)}")
draw_text(0, SCREEN_HEIGHT - 40, "F1: Reset position")
draw_text(0, SCREEN_HEIGHT - 60, "Shift + 9: Restart game")

var ver_str = "Complete Cook" 

draw_set_halign(fa_right)
draw_set_alpha(0.5)
draw_set_color(c_black)
draw_rectangle(SCREEN_WIDTH - string_width(ver_str) - 4, SCREEN_HEIGHT - string_height(ver_str), SCREEN_WIDTH, SCREEN_HEIGHT, false)

draw_reset_color()

draw_text(SCREEN_WIDTH - 2, SCREEN_HEIGHT, ver_str)
