function get_dark(argument0, argument1)
{
	if argument1
	{
		var d = (room_width * room_height)
		var b = d
		var bb = b
		with (obj_lightsource)
		{
			var dis = distance_to_object(other)
			if (distance_to_object(other) < d)
			{
				bb = (dis / distance)
				if (bb < b)
				{
					b = bb
					d = dis
				}
			}
		}
		var t = ((b + 0.4) * 255)
		t = clamp(t, 0, 255)
		return make_color_rgb((color_get_red(argument0) - t), (color_get_green(argument0) - t), (color_get_blue(argument0) - t));
	}
	else
		return image_blend;
}
