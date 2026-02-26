var c_pos = {
	x: obj_camera.campos.x,
	y: obj_camera.campos.y,
}

if state == 0
{
	draw_set_alpha(white_fade_alpha)
	draw_set_color(c_white)
	draw_rectangle(c_pos.x, c_pos.y, c_pos.x + screen_w, c_pos.y + screen_h, false)
	draw_set_alpha(1)
}

if (state != 0 && state < 3)
{
	pattern_draw(sprite_index, image_index, x, y, obj_player.pattern_spr)
	pal_swap_set(pal_peppino, obj_player.pal_select, false)
	draw_self()
	pal_swap_reset()
}

if state >= 2
{
	draw_set_alpha(brown_alpha)
	draw_set_color(make_color_rgb(216, 144, 96))
	draw_rectangle(0, 0, screen_w, screen_h, false)
	draw_set_alpha(1)
	
	shader_set(shd_rank_brown)
	//fix for sprite alpha issue | draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, brown_alpha)
	draw_self()
	shader_reset()
	
	for (var i = 0; i < array_length(toppins); i++) 
	{
		var cur_toppin = toppins[i]
		with cur_toppin
			draw_sprite_ext(spr_ranktoppins, image_index, x, y - sprite_get_yoffset(spr_ranktoppins), 1, image_yscale, 0, image_blend, 1)
	}
	
	for (i = 0; i < array_length(results); i++) 
	{
		var cur_result = results[i]
	    if cur_result[2] == true //visible
		{
			draw_set_align(fa_left, fa_top)
			draw_set_font(global.generic_font)
			draw_set_color(c_white) //                                  info name               float
			draw_text(48, 48 + (string_height("M") * i), string_concat(cur_result[0], string(cur_result[1])))
		}
	}
}
