var names = struct_get_names(global.parallaxLayers)
for (var i = 0; i < array_length(names); i++) {
	with global.parallaxLayers[$ names[i]] {
		switch baseName {
			case "Backgrounds_scroll":
				scroll()
				x = (CAM_X * factor) + x_scroll
				y = (CAM_Y * factor) + y_scroll
				break;
			case "Backgrounds_Ground":
				x = CAM_X * factor
				break;	
	        case "Backgrounds_H":
				x = CAM_X * factor
				y = CAM_Y
	            break;
			case "Backgrounds_sky":
				scroll()
				x = CAM_X + x_scroll
				y = CAM_Y + y_scroll
				break;
			case "Backgrounds_stillfit":
				x = calculateStillX()
				y = calculateStillY()
				break;
			case "Backgrounds_stillH":
				if name == "Backgrounds_stillH" {
					x = CAM_X
					y = calculateStillY()
				} else {
					x = CAM_X * factor
					y = (calculateStillY() * (1 - factor))	
				}
				break;
			case "Foregrounds_Ground":
				x = CAM_X * factor
				y = room_height - sprite_get_height(sprite_index)
				break;
			default:
				x = x_offset + CAM_X * factor
				y = y_offset + CAM_Y * factor
		}
		image_index += image_speed
		image_index %= sprite_get_number(sprite_index)
		layer_x(layerid, x)
		layer_y(layerid, y)
		layer_background_index(bgID, image_index)
		layer_background_sprite(bgID, sprite_index)
	}
}