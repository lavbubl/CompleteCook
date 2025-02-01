if !global.panic
	exit;

draw_set_font(-4)
draw_set_color(c_white)
draw_set_alpha(1)
draw_set_halign(fa_center)
draw_set_valign(fa_center)

var minutes = 0
for (var seconds = ceil(global.panic_timer / 12); seconds > 59; seconds -= 60)
	minutes++

if (seconds < 10)
	seconds = string_concat("0", seconds)
else
	seconds = string(seconds)

draw_text(screen_w / 2, screen_h - 100, string_concat(minutes, ":", seconds))
