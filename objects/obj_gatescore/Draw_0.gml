depth = -200

draw_sprite(spr_pizzascore, image_index, x, y)

draw_set_font(global.scorefont)
draw_reset_color()
draw_set_align(fa_left, fa_top)

var text_offset = 0
switch floor(image_index)
{
	case 1:
	case 2:
	case 3:
	    text_offset = 1
	    break
	case 5:
	case 10:
	    text_offset = -1
	    break
	case 6:
	case 9:
	    text_offset = -2
	    break
	case 7:
	    text_offset = -3
	    break
	case 8:
	    text_offset = -5
	    break
}

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
