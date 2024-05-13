if (instance_exists(obj_option))
	exit;
reset_blendmode()
reset_shader_fix()
draw_set_alpha(1)
if pause
{
	draw_rectangle(0, 0, 960, 540, false)
	if (appsprite != -4)
		draw_sprite(appsprite, 0, 0, 0)
	if (guisprite != -4)
		draw_sprite(guisprite, 0, 0, 0)
}
draw_set_alpha(fade - 0.5)
draw_rectangle_color(0, 0, 960, 540, c_white, c_white, c_white, c_white, false)
draw_set_alpha(1)
if pause
{
	var pad = 48
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	var xx = 490
	var yy = 48
	for (var i = 0; i < array_length(pause_menu); i++)
	{
		var c = c_gray
		yy = (96 + (pad * i))
		if (selected == i)
		{
			c = 16777215
			draw_sprite(spr_cursor, cursor_index, (xx - 48), (yy + (cursor_sprite_height / 2)))
		}
		draw_text_color(xx, yy, pause_menu[i], c, c, c, c, 1)
	}
	xx = 256
	yy = 192
}
