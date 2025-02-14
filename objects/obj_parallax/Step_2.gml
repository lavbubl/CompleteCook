var l = layer_get_all()
var camera_pos = {
	x: obj_camera.campos.x,
	y: obj_camera.campos.y
}

bg_scroll.x++
bg_scroll.y++

for (var i = 0; i < array_length(l); i++)
{
	var bg_id = l[i]
	
	switch (layer_get_name(bg_id))
	{
		case "Backgrounds_1":
			layer_x(bg_id, camera_pos.x * 0.25)
			layer_y(bg_id, camera_pos.y * 0.25)
			break;
		case "Backgrounds_scroll1":
			layer_x(bg_id, (camera_pos.x * 0.25) + (bg_scroll.x * layer_get_hspeed(bg_id)))
			layer_y(bg_id, (camera_pos.y * 0.25) + (bg_scroll.y * layer_get_vspeed(bg_id)))
			break;
	}
}