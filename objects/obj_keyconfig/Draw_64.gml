var padding = 10
var h = 48

offset = lerp(offset, selected * h, 0.1)

draw_set_color(c_black)
draw_set_font(global.creditsfont)

draw_set_color(c_white)
draw_set_align(fa_left, fa_middle)
draw_text(padding, padding - h - offset + 24 + h, "Back")

for (var i = 0; i < array_length(binds); i++) 
{
	var yy = padding + (i * h) - offset + 24 + h
	var cur_key = binds[i]
	
	draw_set_font(global.creditsfont)
	draw_set_color(selected == i ? c_white : c_gray)
	draw_set_align(fa_left, fa_middle)
    draw_text(padding * 4, yy, cur_key.name)
	draw_set_align(fa_center, fa_middle)
	
	draw_sprite(spr_controlicons, cur_key.image_index, screen_w - padding - 50, yy)
	
	if is_array(cur_key.input)
	{
		var xo = 0
		for (var j = 0; j < array_length(cur_key.input); j++) 
		{
			cc_draw_key(screen_w - padding - 100 - xo, yy, cur_key.input[j])
			xo += 40
		}
	}
	else
		cc_draw_key(screen_w - padding - 100, yy, cur_key.input)
		
	draw_set_color(c_white)
}

if binding
{
	draw_set_color(c_black)
	draw_set_alpha(0.5)
	
	draw_rectangle(0, 0, screen_w, screen_h, false)
	
	draw_set_font(global.generic_font)
	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_set_align(fa_center, fa_middle)
	
	draw_text(screen_w / 2, screen_h / 2, "PRESS A KEY TO BIND")
}
