if !visible
	exit;

draw_set_align(fa_left, fa_bottom)

draw_sprite(spr_pizzascore, image_index, x, y)

var num = global.score

draw_set_font(global.scorefont)
draw_set_alpha(1)
draw_set_color(c_white)

var arr = obj_collect_got_visual.collects

for (var i = 0; i < array_length(arr); i++) 
{
	var c_id = arr[i]
	num -= c_id.val
}

var str = string(num)
var num = string_length(str)
var w = string_width(str)
var xx = x - (w / 2)

/*if lastcollect != sc
{
	color_array = array_create(num, 0)
	for (i = 0; i < array_length(color_array); i++)
		color_array[i] = choose(irandom(3))
	lastcollect = sc
}

shader_set(global.Pal_Shader)
draw_set_alpha(alpha)*/

var text_y = 0;

for (var i = 0; i < num; i++)
{
	var yy = (((i + 1) % 2) == 0) ? -5 : 0
	//var c = color_array[i]
	//pal_swap_set(spr_font_palette, c, false)
	draw_text(floor(xx), floor((y) + text_y + yy), string_char_at(str, i + 1))
	xx += (w / num)
}

var rank_ix = 0
var rank_scale = 1

var r_pos = {
	x: x + 142,
	y: y - 22
}

draw_sprite_ext(spr_ranks_hud, rank_ix, r_pos.x, r_pos.y, rank_scale, rank_scale, 0, c_white, 1)

//draw_sprite_part(spr_ranks_hudfill, rank_ix, 0, top, spr_w, (spr_h - top), (rx - spr_xo), (ry - spr_yo + top))

var hf = spr_ranks_hudfill

draw_sprite_part(spr_ranks_hudfill, rank_ix, 0, 50, sprite_get_width(hf), sprite_get_height(hf) - 50, r_pos.x - sprite_get_xoffset(hf), (r_pos.y - sprite_get_yoffset(hf) + 50))

//draw_text(400, 150, obj_generichandler.combo_score)
