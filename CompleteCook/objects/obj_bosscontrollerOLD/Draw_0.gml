if (state == states.transitioncutscene or state == states.victory or state == states.gameover)
{
	draw_set_alpha(fade)
	var cx = camera_get_view_x(view_camera[0])
	var cy = camera_get_view_y(view_camera[0])
	var cw = camera_get_view_width(view_camera[0])
	var ch = camera_get_view_height(view_camera[0])
	draw_rectangle_color(cx, cy, (cx + cw), (cy + ch), c_white, c_white, c_white, c_white, 0)
	draw_set_alpha(1)
}
var _super_bg = 0
with (obj_player)
{
	if (state == states.playersuperattack && superattackstate == states.punch)
		_super_bg = 1
}
if _super_bg
{
	for (var i = 0; i < 2; i++)
		draw_sprite(spr_superattack_bg, 0, camera_get_view_x(view_camera[0]), ((camera_get_view_y(view_camera[0]) + bg_super_y) + (540 * i)))
}
