for (var i = 0; i < array_length(collects); i++) {
	var c_id = collects[i]
	var dir = point_direction(c_id.x, c_id.y, obj_score.x, obj_score.y)
	c_id.x += lengthdir_x(maxspeed, dir)
	c_id.y += lengthdir_y(maxspeed, dir)
	var w = 20
	var h = 20
	var b = {
		left: c_id.x = w,
		top: c_id.y - h,
		right: c_id.x + w,
		bottom: c_id.y + h,
	}
	if point_in_rectangle(obj_score.x, obj_score.y, b.left, b.top, b.right, b.bottom)
	{
		array_delete(collects, i, 1)
		obj_score.shake_mag = 10
	}
}
