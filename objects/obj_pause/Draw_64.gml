draw_set_color(c_white)

if pause
{
	draw_rectangle(0, 0, screen_w, screen_h, false)
	draw_sprite(pause_image, 0, 0, 0)
}

pause_alpha = approach(pause_alpha, pause ? 1 : 0, 0.1)

if pause_alpha > 0
{
	draw_set_alpha(pause_alpha - 0.5)
	draw_rectangle(0, 0, screen_w, screen_h, false)

	draw_set_alpha(pause_alpha)
	
	if global.in_level
	{
		var tx = 180
		var ty = screen_h - 179
		
		var t_ix = global.level_data.treasure
		
		draw_sprite(spr_treasurepodium, 0, tx, ty)
		draw_sprite(spr_pause_treasuretext, t_ix, tx, ty)
		
		draw_sprite(spr_secretportal, 0, screen_w - 132, screen_h - 124);
		
		draw_set_font(global.bignumber_font)
		draw_set_align(fa_right, fa_middle)
		draw_text(screen_w - 192, screen_h - 132, $"{global.level_data.secret_count}/3");
	}
	
	draw_set_font(global.generic_font)
	draw_set_align(fa_center, fa_top)
	
	var s = 40
	
	var pad = 16
	var len = array_length(options)
	var sw = screen_w / 2
	var sh = (screen_h / 2) - (((s * len) + (pad * (len - 1))) / 2)	

	for (var i = 0; i < len; i++) 
	{
		var selected = optionselected == i
		var option = options[i]
		var str = $"{option.o_name}"
		var yy = sh + ((s + pad) * i) - pad / 2
		option.iconalpha = approach(option.iconalpha, selected ? 1 : 0, 0.2)
		draw_set_color(selected ? c_white : c_grey)
		draw_text(sw, yy, str)//placeholder spritre
		draw_sprite_ext(spr_pause_icons, option.icon_index, sw + (string_width(str) / 2) + 50 + irandom_range(-1, 1), yy + irandom_range(-1, 1), 1, 1, 0, c_white, min(pause_alpha, option.iconalpha))
		//THIS IS SO FUCKING LONG I HATE EVRRYTHINGFBVSTBYIGYBYSBISUNBYBIO
	}
	
	option = options[optionselected]
	
	str = $"{option.o_name}"
	
	sw -= (string_width(str) / 2)
	
	var cx = pause ? sw - 60 : screen_w / 2
	var cy = pause ? sh + ((s + pad) * optionselected) : 0
	
	with cursor
	{
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, other.pause_alpha)
		image_index = wrap(sprite_get_number(sprite_index), image_index + image_speed)
		x = lerp(x, cx, 0.1)
		y = lerp(y, cy, 0.1)
	}
}

draw_reset_color()

for (i = 0; i < array_length(screen_assets); i++) {
	
	with screen_assets[i]
	{
		x = lerp(x, other.pause ? endx : startx, 0.1)
		y = lerp(y, other.pause ? endy : starty, 0.1)
		draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, 1)
	}
}
