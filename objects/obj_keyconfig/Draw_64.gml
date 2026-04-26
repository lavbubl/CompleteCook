var h = 50

offset = lerp(offset, max(selected, 0) * h, 0.1)

draw_set_font(global.generic_font)

draw_set_color(selected == -1 ? c_white : c_gray)
draw_set_align(fa_left, fa_top)
draw_text((screen_w / 2) - 250, h + 8, "BACK")
draw_set_color(c_white)

var _prev_input_type = global.input_type
global.input_type = target_drawing_type

for (var i = 0; i < array_length(binds); i++) 
{
	var xx = (screen_w / 2) - 60
	var yy = (i + 1) * h - offset
	var cur_key = binds[i]
	
	var _c = selected == i ? c_white : c_gray
	draw_set_color(_c)
	draw_set_align(fa_left, fa_top)
	
	if cur_key.image_index > -1 || cur_key == ""
		draw_sprite_ext(spr_controlicons, cur_key.image_index, xx, yy, 1, 1, 0, _c, 1)
	else
		draw_text(xx, yy + 8, cur_key.name)
	
	var _bind = global.bindslist[$ cur_key.bindname][target_drawing_type == INPUT_TYPE.KEYBOARD ? 0 : 1]
	var xo = screen_w - 64
	if is_array(_bind)
	{
		for (var j = 0; j < array_length(_bind); j++) 
		{
			cc_draw_key(xo, yy, _bind[j])
			xo -= 48
		}
	}
	else
		cc_draw_key(xo, yy, _bind)
	
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

global.input_type = _prev_input_type

draw_set_font(global.creditsfont)
draw_set_align(fa_left, fa_top)
xx = 32
yy = screen_h - 240

for (i = 0; i < array_length(config_buttons); i++) {
    var _cur_button = config_buttons[i]
	cc_draw_key(xx, yy, input_get_bind(_cur_button[0])[0])
	draw_text(xx + 32, yy, _cur_button[1])
	yy += 80
}
