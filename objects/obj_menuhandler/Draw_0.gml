for (var i = 0; i < array_length(tvs); i++) 
{
    var cur_tv = tvs[i]
	
	with cur_tv
	{
		if pal_ix == 12
			pattern_draw(sprite_index, image_index, x, y, pat_spr)
			
		pal_swap_set(pal_peppino, pal_ix, false)
		if sprite_index != noone
			draw_sprite(sprite_index, image_index, x, y)
		shader_reset()
															 //image_speed
		image_index = wrap(sprite_get_number(sprite_index), image_index + 0.35)

	}
}

if menu_dark
{
	var v = 1
	if dark_state == 1
		v = round(wave(0, 1, 0.2, 0))
	else if dark_state == 2
		v = 0
	
	if v == 1
		draw_sprite(bg_mainmenu_dark, 0, 0, 0)
}

draw_reset_color(optionsalpha)
draw_set_align(fa_center, fa_middle)

per += 0.1
if per > 102
	per = 0

var _per = floor(per)
var _save = tvs[cur_selected - 1].save_exists

if !_save
	_per = 0

draw_sprite(spr_menustatus, 0, 183, 312);
draw_set_font(global.bignumber_font);
draw_text(196, 326, _per)

var _ix = floor(_per / 14.285714285714286); // 100 / 7

_ix = min(_ix, 7)

if _per >= 101
	_ix = 8
	
var rank_ix = 0

var ranks = [
	50,
	61,
	72,
	83,
	95
]

var _quick = irandom_range(0, 10) == 10

for (var i = array_length(ranks) - 1; i >= 0; i--) 
{
	if _per >= ranks[i]
	{
		rank_ix = i + 1
		break;
	}
}

if _quick
{
	if rank_ix == 5
		rank_ix = 7 //holy shit
	else
		rank_ix = 6 //quick
}

draw_sprite(spr_menustatus_pizzaboy, _ix, 199, 443);

if _save
	draw_sprite(spr_menustatus_judgement, rank_ix, 199, 493);

draw_set_align(fa_left, fa_top)
draw_sprite(spr_menuquit, 0, 0, 0);
cc_draw_key_arr(50, 100, input_get_bind(INPUTS.ui_quit))

draw_sprite(spr_menupause, 0, 819, 84);
cc_draw_key_arr(731, 47, input_get_bind(INPUTS.ui_start))

draw_sprite(spr_menudelete, 0, 779, 449);

cc_draw_key_arr(712, 449, input_get_bind(INPUTS.ui_delete))

if !tvs[cur_selected - 1].save_exists
	draw_sprite(spr_menukeyoverlay, 0, 712, 449)

draw_reset_color(1)
