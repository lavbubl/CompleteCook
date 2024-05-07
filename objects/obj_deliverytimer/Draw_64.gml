draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
var str = ""
if (minutes < 10)
	str += "0"
str += (string(minutes) + ":")
if (seconds < 10)
	str += "0"
str += string(seconds)
draw_set_color(c_white)
draw_text(480, 490, str)
