draw_reset_color()
var FUCKER_VARIABLEFUCKING_DIE = current_time * 0.04
draw_sprite_tiled(spr_optionbg, 0, FUCKER_VARIABLEFUCKING_DIE, FUCKER_VARIABLEFUCKING_DIE + wave(-30, 30, 3, 0))

draw_set_align(fa_center, fa_center)
draw_set_font(global.generic_font)

var s = string_height("M")

var sw = screen_w / 2
var sh = (screen_h / 2) - ((s * array_length(options)) / 2)

var yy = sh

for (var i = 0; i < array_length(options); i++) 
{
	var option = options[i]
	
	option.optionstr = $"{option.o_name}{option.val}"
	
	if option.o_type == optiontypes.multichoice
		option.optionstr = $"{option.o_name}{option.choices[option.val]}"
		
	draw_text(sw, yy, option.optionstr)
	
	yy += s
}

option = options[optionselected]

sw -= (string_width(option.optionstr) / 2)

draw_sprite(spr_cursor, 0, sw, sh + (optionselected * s))
