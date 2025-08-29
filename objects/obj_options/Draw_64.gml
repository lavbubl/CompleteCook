draw_reset_color()
var FUCKER_VARIABLEFUCKING_DIE = current_time * 0.04
draw_sprite_tiled(spr_optionbg, 0, FUCKER_VARIABLEFUCKING_DIE, FUCKER_VARIABLEFUCKING_DIE)

draw_set_align(fa_center, fa_center)
draw_set_font(global.generic_font)

var s = string_height("M")

var sw = screen_w / 2
var sh = (screen_h / 2) - ((s * array_length(options)) / 2)

var yy = sh

for (var i = 0; i < array_length(options); i++) 
{
	var color = c_gray
	if (optionselected == i)
		color = c_white
	
	draw_set_color(color)
	
	var option = options[i]
	
	option.optionstr = $"{option.o_name}{option.val}"
	
	if option.o_type == optiontypes.multichoice
		option.optionstr = $"{option.o_name}{option.choices[option.val]}"
		
	if option.o_type == optiontypes.onoff
		option.optionstr = $"{option.o_name}{option.val == true ? "ON" : "OFF"}"
		
	draw_text(sw, yy, option.optionstr)
	
	yy += s
}

draw_set_color(c_white)

option = options[optionselected]

sw -= (string_width(option.optionstr) / 2)

//draw_sprite(spr_cursor, 0, sw, sh + (optionselected * s))
//why...??