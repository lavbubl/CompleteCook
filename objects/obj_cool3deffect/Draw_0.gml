var camera_pos = {
	x: obj_camera.campos.x,
	y: obj_camera.campos.y
}

var far_par_multi = 0.9
var near_par_multi = 0

var _tex = sprite_get_texture(bg_cool3deffect, 0); //have to use special seperated sprite for repeating to work

draw_reset_color()

var x1 = top_points.x + (camera_pos.x * far_par_multi)
var y1 = top_points.y + (camera_pos.y * far_par_multi)
var x2 = top_points.x + (camera_pos.x * far_par_multi)
var y2 = top_points.y + (camera_pos.y * far_par_multi)
var x3 = bottom_points.x + (camera_pos.x * near_par_multi)
var y3 = bottom_points.y + (camera_pos.y * near_par_multi)
var x4 = bottom_points.x + width + (camera_pos.x * near_par_multi)
var y4 = bottom_points.y + (camera_pos.y * near_par_multi)

var top_midpoint = lerp(x1, x2, 0.5)
var bottom_midpoint = lerp(x3, x4, 0.5)

draw_primitive_begin_texture(pr_trianglelist, _tex);

draw_vertex_texture(top_midpoint, y1,		0.5, 0)
draw_vertex_texture(bottom_midpoint, y3,	0.5, 1)
draw_vertex_texture(x3, y4,					0, 1)

draw_vertex_texture(top_midpoint, y2,		0.5, 0)
draw_vertex_texture(bottom_midpoint, y3,	0.5, 1)
draw_vertex_texture(x4, y4,					1, 1)

draw_primitive_end()

//layer_x(bg_id, camera_pos.x * 0.22)
//layer_y(bg_id, camera_pos.y)
