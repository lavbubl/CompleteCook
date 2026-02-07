var camera_pos = {
	x: camera_get_view_x(view_camera[0]),
	y: camera_get_view_y(view_camera[0])
}

bg_scroll.x++
bg_scroll.y++

for (var i = 0; i < array_length(l); i++)
{
	var bg_id = l[i]
	
	var _lay_name = layer_get_name(bg_id)
	switch (_lay_name)
	{
		case "Backgrounds_1":
			layer_x(bg_id, offsets[i].x + (camera_pos.x * 0.25))
			layer_y(bg_id, offsets[i].y + (camera_pos.y * 0.25))
			break;
		case "Backgrounds_2":
			layer_x(bg_id, offsets[i].x + (camera_pos.x * 0.2))
			layer_y(bg_id, offsets[i].y + (camera_pos.y * 0.2))
			break;
		case "Backgrounds_3":
			layer_x(bg_id, offsets[i].x + (camera_pos.x * 0.15))
			layer_y(bg_id, offsets[i].y + (camera_pos.y * 0.15))
			break;
        case "Backgrounds_Ground1":
            layer_x(bg_id, camera_pos.x * 0.2)
            break;
        case "Backgrounds_Ground2":
            layer_x(bg_id, camera_pos.x * 0.18)
            break;
        case "Backgrounds_Ground3":
            layer_x(bg_id, camera_pos.x * 0.16)
            break;
        case "Backgrounds_H1":
            layer_x(bg_id, camera_pos.x * 0.22)
            layer_y(bg_id, camera_pos.y)
            break;
            break;
        case "Backgrounds_H2":
            layer_x(bg_id, camera_pos.x * 0.11)
            layer_y(bg_id, camera_pos.y)
            break;
        case "Backgrounds_sky":
        case "Backgrounds_still":
            layer_x(bg_id, camera_pos.x + (bg_scroll.x * layer_get_hspeed(bg_id)))
            layer_y(bg_id, camera_pos.y + (bg_scroll.y * layer_get_vspeed(bg_id)))
            break;
        case "Backgrounds_stillfit":
			var _spr = layer_background_get_sprite(layer_background_get_id(bg_id))
			var _dist_x = camera_pos.x / (room_width - screen_w)
			var _dist_y = camera_pos.y / (room_height - screen_h)
			layer_x(bg_id, camera_pos.x - (_dist_x * max(sprite_get_width(_spr) - screen_w, 0)))
			layer_y(bg_id, camera_pos.y - (_dist_y * max(sprite_get_height(_spr) - screen_h, 0)))
            break;
		case "Backgrounds_stillH":
			var _spr = layer_background_get_sprite(layer_background_get_id(bg_id))
			var _dist = camera_pos.y / (room_height - screen_h)
			layer_x(bg_id, camera_pos.x)
			layer_y(bg_id, camera_pos.y - (_dist * max(sprite_get_height(_spr) - screen_h, 0)))
			break;
		case "Backgrounds_stillH1":
		case "Backgrounds_stillH2":
		case "Backgrounds_stillH3":
		case "Backgrounds_stillH4":
			var _spr = layer_background_get_sprite(layer_background_get_id(bg_id))
			var _dist = camera_pos.y / (room_height - screen_h)
			var _factor = stillHfactors[$ _lay_name]
			layer_x(bg_id, camera_pos.x * _factor)
			layer_y(bg_id, camera_pos.y - (_dist * max(sprite_get_height(_spr) - screen_h, 0) * (1 - _factor)))
			break;
		case "Backgrounds_scroll":
		case "Backgrounds_scroll1":
			layer_x(bg_id, (camera_pos.x * 0.3) + (bg_scroll.x * layer_get_hspeed(bg_id)))
			layer_y(bg_id, (camera_pos.y * 0.3) + (bg_scroll.y * layer_get_vspeed(bg_id)))
			break;
		case "Backgrounds_scroll2":
			layer_x(bg_id, (camera_pos.x * 0.25) + (bg_scroll.x * layer_get_hspeed(bg_id)))
			layer_y(bg_id, (camera_pos.y * 0.25) + (bg_scroll.y * layer_get_vspeed(bg_id)))
			break;
		case "Backgrounds_scroll3":
			layer_x(bg_id, (camera_pos.x * 0.2) + (bg_scroll.x * layer_get_hspeed(bg_id)))
			layer_y(bg_id, (camera_pos.y * 0.2) + (bg_scroll.y * layer_get_vspeed(bg_id)))
			break;
		case "Foregrounds_1":
			layer_x(bg_id, camera_pos.x * -0.15)
			layer_y(bg_id, camera_pos.y * -0.15)
			break;
		case "Foregrounds_2":
			layer_x(bg_id, camera_pos.x * -0.25)
			layer_y(bg_id, camera_pos.y * -0.25)
			break;
		case "Foregrounds_3":
			layer_x(bg_id, camera_pos.x * -0.35)
			layer_y(bg_id, camera_pos.y * -0.35)
			break;
        case "Foregrounds_Ground1":
            layer_x(bg_id, camera_pos.x * -0.15)
            layer_y(bg_id, room_height - sprite_get_height(layer_background_get_sprite(layer_background_get_id(bg_id))))
            break;
	}
}