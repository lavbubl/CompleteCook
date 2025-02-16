if state == 0
{
	var c_pos = {
		x: obj_camera.campos.x,
		y: obj_camera.campos.y,
	}
	draw_set_alpha(white_fade_alpha)
	draw_set_color(c_white)
	draw_rectangle(c_pos.x, c_pos.y, c_pos.x + screen_w, c_pos.y + screen_h, false)
	draw_set_alpha(1)
}
else
	draw_self()
