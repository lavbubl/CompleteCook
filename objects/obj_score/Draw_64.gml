depth = -200

var num = global.score

var rank_ix = 0
var ranks = [
	global.rank_milestones.c,
	global.rank_milestones.b,
	global.rank_milestones.a,
	global.rank_milestones.s
]

var s = global.score + obj_levelcontroller.combo_score

if (s >= global.rank_milestones.s && check_p_rank())
	rank_ix = 5
else
{
	for (var i = 4; i >= 1; i--) 
	{
		if s >= ranks[i - 1]
		{
			rank_ix = i
			break;
		}
	}
}

draw_set_align(fa_left, fa_top)

draw_sprite(spr_pizzascore, image_index, x, y)

var text_offsets = [0, 1, 1, 1, 0, -1, -2, -3, -5, -2, -1, 0]

var text_offset = text_offsets[image_index]

for (var i = 0; i < min(rank_ix, 4); i++)
	draw_sprite(spr_pizzascore_toppings, i, x, y + text_offset)

draw_set_font(global.scorefont)
draw_reset_color()

var arr = obj_collect_got_visual.collects

for (var i = 0; i < array_length(arr); i++) 
{
	var c_id = arr[i]
	num -= c_id.val
}

var str = string(num)
var len = string_length(str)
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

for (var i = 0; i < len; i++)
{
	var yy = (((i + 1) % 2) == 0) ? -5 : 0
	//var c = color_array[i]
	//pal_swap_set(spr_font_palette, c, false)
	draw_text(floor(xx), floor((y - 56) + text_y + yy), string_char_at(str, i + 1))
	xx += (w / len)
}

var r_pos = {
	x: x + 142,
	y: y - 22
}

if (prev_rank_ix != rank_ix)
{
    if (rank_ix > prev_rank_ix)
		var snd = $"sfx_rankup{rank_ix}"
	else
		snd = $"sfx_rankdown{5 - rank_ix}"
	scr_sound(asset_get_index(snd))
    rank_scale = 3
    prev_rank_ix = rank_ix
}

draw_sprite_ext(spr_ranks_hud, rank_ix, r_pos.x, r_pos.y, rank_scale, rank_scale, 0, c_white, 1)
rank_scale = max(rank_scale - 0.2, 1)

var hf = spr_ranks_hudfill

var perc = 0

if rank_ix >= 4 //if the rank is above an s set the percentage to 100%
	perc = 1
else if rank_ix == 0 //or if the rank is above a d set the percentage to the score divided by the next rank milestone, c
	perc = global.score / global.rank_milestones.c
else //otherwise --------------------------------------------------------------------------v
	perc = (global.score - ranks[rank_ix - 1]) / (ranks[rank_ix] - ranks[rank_ix - 1]) //set the percentage to the distance of the score and the previous rank milestone divided by the distance between the current rank milestone and the last

var t = sprite_get_height(spr_ranks_hudfill) * perc
var top = sprite_get_height(spr_ranks_hudfill) - t //too lazy to write something better than the official game

draw_sprite_part(spr_ranks_hudfill, rank_ix, 0, top, sprite_get_width(hf), sprite_get_height(hf) - top, r_pos.x - sprite_get_xoffset(hf), (r_pos.y - sprite_get_yoffset(hf) + top))
