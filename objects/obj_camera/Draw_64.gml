draw_set_font(-4)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

draw_set_alpha(0.5)
draw_set_color(c_black)
draw_rectangle(0, 0, 300, 40, false)

draw_set_alpha(1)
draw_set_color(c_white)

draw_text(0, 0, $"fps : {fps}")
draw_text(0, 20, $"fps_real: {fps_real}")

var ver_str = $"Complete Cook {version}" //haha yes overcomplicated code >:)

draw_set_halign(fa_right)
draw_set_valign(fa_bottom)

draw_set_alpha(0.5)
draw_set_color(c_black)
draw_rectangle(screen_w - string_width(ver_str), screen_h - string_height(ver_str), screen_w, screen_h, false)

draw_set_alpha(1)
draw_set_color(c_white)

draw_text(screen_w, screen_h, ver_str)
