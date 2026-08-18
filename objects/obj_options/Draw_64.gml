draw_reset_color()
draw_sprite_tiled(spr_optionbg, bg_ix, bg_inc, bg_inc)

if bg_alpha > 0
{
	draw_sprite_tiled_ext(spr_optionbg, prev_bg_ix, bg_inc, bg_inc, 1, 1, c_white, bg_alpha)
	bg_alpha = approach(bg_alpha, 0, bg_spd)
}

bg_inc--

if bg_inc <= -400
	bg_inc = 0 - (-400 + bg_inc)

if !execute_code
	exit;

var _centered = list_ix == 0 || list_ix == 64

draw_set_align(fa_center, fa_top)
draw_set_font(global.generic_font)

cur_list = list_arr[list_ix]

var _str_h = string_height("M")

var s = _str_h + (list_ix == 0 ? 8 : 0)

var sw = 150

if _centered
	sw = SCREEN_WIDTH / 2

var sh = (SCREEN_HEIGHT / 2) - ((s * array_length(cur_list)) / 2) + 8

var yy = sh

for (var i = 0; i < array_length(cur_list); i++) 
{
	draw_set_color(optionselected == i ? c_white : c_gray)
	
	var option = cur_list[i]
	
	var _name = global.language_text_map[? option.o_name]

	if !_centered
	{
		draw_set_halign(fa_left)
		
		if string_height(_name) > _str_h
			draw_set_font(global.smallerfont)
		
		draw_text(sw, yy, _name)
		draw_set_font(global.generic_font)
		
		draw_set_halign(fa_right)
	}
	
	var _val_str = ""
	
	switch option.o_type
	{
		case types.onoff:
			_val_str = option.val == true ? text_option_on : text_option_off
			break;
		case types.slider:
			var _w = 200
			var _x2 = SCREEN_WIDTH - 150 - _w
			var _x3 = lerp(_x2, _x2 + 200, option.val)
			draw_sprite(spr_slider, 0, _x2, yy);
			draw_sprite(list_ix == 1 ? spr_slidericon : spr_slidericon2, moving && optionselected == i, _x3, yy);
			break;
		case types.multichoice:
			_val_str = option.val[1][option.val[0]]
			break;
	}
	
	if list_ix == 0
	{
		draw_text(sw, yy + 8, _name)
		
		option.iconalpha = approach(option.iconalpha, optionselected == i, 0.2)
		if option.iconalpha > 0
			draw_pause_icon(option.icon_ix, sw + (string_width(_name) / 2) + 50, yy + (string_height(_name) / 2), option.iconalpha)
	}
	else
	{	
		if string_height(_val_str) > _str_h
			draw_set_font(global.smallerfont)
		
		draw_text(SCREEN_WIDTH - sw, yy, _val_str)
		
		s = max(_str_h, string_height(_name), string_height(_val_str))
		
		draw_set_font(global.generic_font)
		
	}
	
	yy += s
}

draw_set_color(c_white)

option = cur_list[optionselected]
