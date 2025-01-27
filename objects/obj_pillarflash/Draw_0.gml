draw_set_color(c_white)
draw_set_alpha(fade)
draw_rectangle(obj_camera.campos.x, obj_camera.campos.y, obj_camera.campos.x + screen_w, obj_camera.campos.y + screen_h, false)

if pillar_id != -4
{
	with pillar_id
		draw_self()
}

draw_set_alpha(1)
