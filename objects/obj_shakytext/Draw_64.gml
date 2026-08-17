draw_set_font(font)
draw_set_align(align.h, align.v)

depth = -4000

draw_set_color(image_blend)
draw_set_alpha(image_alpha)

cc_draw_text(x, y - (global.panic.active && !global.secret ? 88 : 28), str)

draw_reset_color(1)
