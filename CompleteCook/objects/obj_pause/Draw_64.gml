if (instance_exists(obj_option))
	exit;
draw_set_color(c_white)
draw_set_alpha(1)
if (appsprite != -4 && pause)
{
	draw_rectangle(0, 0, 960, 540, false)
	draw_sprite(appsprite, 0, 0, 0)
}
draw_set_alpha(fade - 0.5)
draw_rectangle(0, 0, 960, 540, false)
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
	shader_set(global.Pal_Shader)
	pal_swap_set(spr_palette, paletteselect, 0)
	draw_sprite(peppino_sprite, peppino_index, xx, yy)
	shader_reset()
	draw_set_font(global.collectfont)
	draw_set_halign(fa_center)
	xx = 689
	yy = 416
	draw_sprite(spr_pizzascore, 0, xx, yy)
	if (global.collect >= global.crank)
		draw_sprite(spr_pizzascore_pepper, 0, xx, yy)
	if (global.collect >= global.brank)
		draw_sprite(spr_pizzascore_pepperoni, 0, xx, yy)
	if (global.collect >= global.arank)
		draw_sprite(spr_pizzascore_olive, 0, xx, yy)
	if (global.collect >= global.srank)
		draw_sprite(spr_pizzascore_shroom, 0, xx, yy)
	draw_text(xx, (yy - 54), global.collect)
	var rank = "D"
	if (global.collect >= global.crank)
		rank = "C"
	if (global.collect >= global.brank)
		rank = "B"
	if (global.collect >= global.arank)
		rank = "A"
	if (global.collect >= global.srank)
		rank = "S"
	xx = 172
	yy = 404
	pad = 40
	for (i = 0; i < array_length(toppin_sprite); i++)
		draw_sprite_ext(toppin_sprite[i], toppin_index[i], (xx + (pad * i)), yy, 1, 1, 0, c_white, (toppin_has[i] ? 1 : 0.5))
}
