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

if instance_exists(obj_keyconfig) || instance_exists(obj_windowmodeconfirm)
	exit;

var _centered = list_ix == 0 || list_ix == 64

draw_set_align(_centered ? fa_center : fa_left, fa_top)
draw_set_font(global.generic_font)

cur_list = list_arr[list_ix]

var s = string_height("M") + (list_ix == 0 ? 16 : 10)

var sw = 150
if _centered
	sw = screen_w / 2
var sh = (screen_h / 2) - ((s * array_length(cur_list)) / 2) + 16

var yy = sh

for (var i = 0; i < array_length(cur_list); i++) 
{
	draw_set_color(optionselected == i ? c_white : c_gray)
	
	var option = cur_list[i]

	if !_centered
	{
		draw_set_align(_centered ? fa_center : fa_left, fa_top)
		draw_text(sw, yy, option.o_name)
		draw_set_halign(fa_right)
	}
	
	var _val_str = ""
	
	switch option.o_type
	{
		case types.onoff:
			_val_str = option.val == true ? "ON" : "OFF"
			break;
		case types.slider:
			var _w = 200
			var _x2 = screen_w - 150 - _w
			var _x3 = lerp(_x2, _x2 + 200, option.val / 100)
			draw_sprite(spr_slider, 0, _x2, yy);
			draw_sprite(list_ix == 1 ? spr_slidericon : spr_slidericon2, moving && optionselected == i, _x3, yy);
			break;
		case types.multichoice:
			_val_str = option.val[1][option.val[0]]
			break;
	}
	
	if list_ix == 0
	{
		option.iconalpha = approach(option.iconalpha, optionselected == i, 0.2)
		if option.iconalpha > 0
			draw_sprite_ext(spr_pause_icons, option.icon_ix, sw + (string_width(option.o_name) / 2) + 50 + irandom_range(-1, 1), yy + irandom_range(-1, 1), 1, 1, 0, c_white, option.iconalpha)
	}
	
	if _centered
		draw_text(sw, yy, option.o_name + _val_str)
	else
		draw_text(screen_w - sw, yy, _val_str)
	
	yy += s
}

draw_set_color(c_white)

option = cur_list[optionselected]
