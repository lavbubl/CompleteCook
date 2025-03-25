depth = -200

draw_sprite(spr_pizzascore, image_index, x, y)

draw_set_font(global.scorefont)
draw_reset_color()
draw_set_align(fa_left, fa_bottom)

var str = string(number)
var num = string_length(str)
var w = string_width(str)
var xx = x - (w / 2)

var ty = ystart + 7

for (var i = 0; i < num; i++)
{
	var yy = (i + 1) % 2 == 0 ? -5 : 0
	draw_text(floor(xx), min(ty + yy, ystart + text_y + (num * 20 - (i * 20))), string_char_at(str, i + 1))
	xx += (w / num)
}
