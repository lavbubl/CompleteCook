if (!ds_list_empty(global.debris_list))
{
	for (var i = 0; i < ds_list_size(global.debris_list); i++)
	{
		var q = ds_list_find_value(global.debris_list, i)
		if is_struct(q)
		{
			with (q)
			{
				if (vsp < 20)
					vsp += grav
				if (type == debris.fade)
				{
					vsp = 0
					alpha -= 0.05
				}
				x += hsp
				y += vsp
				
				var _destroy = false
				if animated
				{
					image_index += image_speed
					if (image_index > (image_number - 1))
					{
						image_index = frac(image_index)
						if destroyonanimation
							_destroy = 1
					}
				}
				
				var outofx = (x > (room_width + sprw) or x < (-sprw))
				var outofy = (y > (room_height + sprh) or y < (-sprh))
				if (outofx or outofy or (type == debris.fade && alpha <= 0))
					_destroy = true
				
				if _destroy
				{
					ds_list_delete(global.debris_list, i)
					i--
					q = undefined
				}
			}
		}
	}
}
if (!ds_list_empty(global.collect_list))
{
	for (i = 0; i < ds_list_size(global.collect_list); i++)
	{
		var b = ds_list_find_value(global.collect_list, i)
		if is_struct(b)
		{
			with (b)
			{
				var _dir = point_direction(x, y, 110, 80)
				hsp = lengthdir_x(16, _dir)
				vsp = lengthdir_y(16, _dir)
				x += hsp
				y += vsp
				image_index += 0.35
				if (image_index > (image_number - 1))
					image_index = frac(image_index)
				outofx = x < 140
				outofy = y < 120
				if (outofx && outofy)
				{
					with (obj_camera)
						collect_shake += 10
					ds_list_delete(global.collect_list, i)
					i--
					b = undefined
				}
			}
		}
	}
}
