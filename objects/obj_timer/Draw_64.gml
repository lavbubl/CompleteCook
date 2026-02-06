draw_reset_color(1)
draw_set_align(fa_right, fa_bottom)
draw_set_font(special_font)

x = screen_w - string_width("A")
y = screen_h

switch global.option_timertype
{
	case 0:
		draw_text(x, y, string_convert_seconds_to_timer(level_timer))
		break;
	case 1:
		draw_text(x, y, string_convert_seconds_to_timer(file_timer))
		break;
	case 2:
		draw_text(x, y, string_convert_seconds_to_timer(file_timer))
		draw_text(x, y - string_height("A"), string_convert_seconds_to_timer(level_timer))
		break;
}
