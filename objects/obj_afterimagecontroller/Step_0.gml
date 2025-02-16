for (var inst = 0; inst < array_length(aftimg_list); inst++) 
{
	var inst_id = aftimg_list[inst]
	
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
					array_delete(other.aftimg_list, inst, 1)
				
				lifetime -= 1
				if (lifetime <= 0)
					array_delete(other.aftimg_list, inst, 1)
				break;
			case after_images.blur:
				image_alpha -= 0.15
				
				if (image_alpha <= 0)
					array_delete(other.aftimg_list, inst, 1)
				break;
			case after_images.solid_color:
				image_alpha -= 0.05
				
				if (image_alpha <= 0)
					array_delete(other.aftimg_list, inst, 1)
				break;
		}
		if (obj_fade.fade)
			array_delete(other.aftimg_list, inst, 1)
	}
}
