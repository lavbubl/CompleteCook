if !hud_get_visible()
	exit;

draw_set_font(global.smallnumberfont)
draw_set_align(fa_center, fa_bottom)
draw_reset_color(1)

if flash
	shader_set(shd_flash)

draw_text(x, y, string(num))

if shader_current() != -1
	shader_reset()