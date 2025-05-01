if !pause
	exit;

draw_set_color(c_white)
draw_rectangle(0, 0, screen_w, screen_h, false)
draw_sprite(pause_image, 0, 0, 0)

draw_set_alpha(0.5)
draw_rectangle(0, 0, screen_w, screen_h, false)
draw_reset_color()

draw_set_align(fa_center, fa_center)
draw_set_font(global.generic_font)

var s = string_height("M")

var sw = screen_w / 2
var sh = (screen_h / 2) - ((s * array_length(options)) / 2)

draw_text(sw, sh, "PAUSE")

sh += s

for (var i = 0; i < array_length(options); i++) 
{
	var option = options[i]
	draw_text(sw, sh + (i * s), $"{option.o_name}{option.val}")
}

option = options[optionselected]

var str = $"{option.o_name}{option.val}"

sw -= (string_width(str) / 2)

draw_sprite(spr_cursor, 0, sw, sh + (optionselected * s))
