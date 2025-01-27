if !global.panic
	exit;

draw_set_color(c_white)
draw_set_alpha(1)

draw_text(screen_w / 2, screen_h - 100, string(global.panic_timer))
