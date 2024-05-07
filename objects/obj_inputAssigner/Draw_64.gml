var _halign = draw_get_halign()
var _valign = draw_get_halign()
draw_set_halign(fa_center)
draw_set_halign(fa_center)
draw_set_alpha(1)
draw_set_color(c_white)
if (!deactivated)
{
	draw_set_font(global.bigfont)
	if press_start
	{
		var _txt = "PRESS START"
		draw_text(480, 298, _txt)
	}
}
else
{
	draw_rectangle_color(0, 0, 960, 540, c_black, c_black, c_black, c_black, 0)
	draw_set_font(global.smallfont)
	_txt = "CONTROLLER DISCONNECTED\n\nPRESS START TO CONTINUE"
	var _h = (string_height(_txt) / 2)
	draw_text(480, (270 - _h), _txt)
}
draw_set_halign(_halign)
draw_set_halign(_valign)
