for (var inst = 0; inst < ds_list_size(aftimg_list); inst++) 
{
	var inst_id = ds_list_find_value(aftimg_list, inst)
	
	with (inst_id)
	{
		switch (effect)
		{
			case after_images.mach:
				var s  = obj_player.state
				
				var m = 1
				if (s == states.mach2 || s == states.mach3)
					m = (obj_player.movespeed / 12)
					
				image_alpha = ceil(sin((lifetime))) * m
				
				if (!obj_player.aftimg_timers.mach.do_it)
					ds_list_delete(other.aftimg_list, inst)
				
				lifetime -= 1
				if (lifetime <= 0)
					ds_list_delete(other.aftimg_list, inst)
				break;
			case after_images.blur:
				image_alpha -= 0.15
				
				if (image_alpha <= 0)
					ds_list_delete(other.aftimg_list, inst)
				break;
		}
		if (obj_fade.fade)
			ds_list_delete(other.aftimg_list, inst)
	}
}
