draw_set_color(c_black)
draw_set_alpha(0.5)
draw_set_font(global.generic_font)

draw_rectangle(0, 0, screen_w, screen_h, false)

draw_reset_color(1)

x = screen_w / 2
y = screen_h / 2

draw_set_align(fa_center, fa_middle)

draw_sprite(sprite_index, image_index, x - 210, y)
draw_sprite(sprite_index, image_index, x + 210, y)

draw_text(x, y - 32, "EXIT THE GAME")

draw_set_color(quit ? c_white : c_gray)
draw_text(x - 100, y + 32, "YES")

draw_set_color(quit ? c_gray : c_white)
draw_text(x + 100, y + 32, "NO")

draw_set_color(c_white)
