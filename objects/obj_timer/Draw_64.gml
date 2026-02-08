draw_reset_color(1)
draw_set_align(fa_left, fa_bottom)
draw_set_font(global.smallerfont)

var _w = string_width("A")
x = screen_w
y = screen_h

var _ltstr = string_convert_seconds_to_timer(level_timer, true, global.option_timerspeedrun)
var _ftstr = string_convert_seconds_to_timer(file_timer, true, global.option_timerspeedrun)

switch global.option_timertype
{
	case 0:
		draw_text(x - ((string_length(_ltstr) - 1) * _w), y, _ltstr)
		break;
	case 1:
		draw_text(x - ((string_length(_ftstr) - 1) * _w), y, _ftstr)
		break;
	case 2:
		draw_text(x - ((string_length(_ftstr) - 1) * _w), y, _ftstr)
		draw_text(x - ((string_length(_ltstr) - 1) * _w), y - string_height("A"), _ltstr)
		break;
}
