var campos = {
	x: obj_player.x - (screen_w / 2),
	y: obj_player.y - (screen_h / 2),
}

if (mag > 0)
{
	campos.x += random_range(mag, -mag)
	campos.y += random_range(mag, -mag)
}

campos.x += cam_charge

camera_set_view_pos(view_camera[0], campos.x, campos.y)
