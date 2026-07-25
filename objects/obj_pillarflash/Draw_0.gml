draw_set_color(c_white)
draw_set_alpha(fade)
draw_rectangle(obj_camera.campos.x, obj_camera.campos.y, obj_camera.campos.x + SCREEN_WIDTH, obj_camera.campos.y + SCREEN_HEIGHT, false)

if pillar_id != -4
{
	with pillar_id
		draw_self()
}

with obj_player
{
	if visible
		event_perform(ev_draw, ev_draw_normal)
}

draw_set_alpha(1)
