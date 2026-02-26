draw_set_font(global.scorefont)
draw_reset_color(1)
draw_set_align(fa_left, fa_top)

var text_offsets = [0, 1, 1, 1, 0, -1, -2, -3, -5, -2, -1, 0]

var text_offset = text_offsets[image_index]

draw_sprite(spr_pizzascore, image_index, x, y)
for (var i = 0; i < min(rank_ix, 4); i++)
	draw_sprite(spr_pizzascore_toppings, i, x, y + text_offset)

var str = string(number)
var num = string_length(str)
var w = string_width(str)
var xx = x - (w / 2)

var ty = ystart + 7

for (var i = 0; i < num; i++)
{
	var yy = (i + 1) % 2 == 0 ? -5 : 0
	draw_text(floor(xx), min(ty + yy - 56 + text_offset, ystart + text_y + (num * 20 - (i * 20))), string_char_at(str, i + 1))
	xx += (w / num)
}

draw_sprite_ext(spr_ranks_hud, rank_ix, x, y + 58, rank_scale, rank_scale, 0, c_white, 1)
