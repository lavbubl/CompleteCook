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
		v = round(wave(0, 1, 0.25, 0))
	else if dark_state == 2
		v = 0
	
	if v == 1
		draw_sprite(bg_mainmenu_dark, 0, 0, 0)
}

var options_x = 819;
var options_y = 84;
draw_set_alpha(optionsalpha)
draw_sprite(spr_menupause, 0, options_x, options_y);
cc_draw_key(options_x - 88, options_y - 37, 27)