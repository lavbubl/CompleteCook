var _pad_x = 100

draw_set_color(c_white)
draw_set_font(global.generic_font)

var _sw = screen_w / 2

draw_set_align(fa_center, fa_top)
var _timer_str = "CONFIRM SETTINGS\nREVERTING IN " + string(ceil(timer / 60)) + "..."
draw_text(_sw, 190, _timer_str)

var _y = 220 + string_height(_timer_str)

draw_set_color(confirm ? c_white : c_gray)
draw_text(_sw - _pad_x, _y, "YES")

draw_set_color(confirm ? c_gray : c_white)
draw_text(_sw + _pad_x, _y, "NO")

draw_reset_color()
