for (var inst = 0; inst < ds_list_size(aftimg_list); inst++) 
{
	var inst_id = ds_list_find_value(aftimg_list, inst)
	
	with (inst_id)
	{
		switch (effect)
		{
			case after_images.mach:
				image_alpha = round((sin(lifetime) / 2) + 0.5) * (obj_player.movespeed / 12)
				
				var s = obj_player.state
				if (s != states.mach2 && s != states.mach3)
					ds_list_delete(other.aftimg_list, inst)
				
				lifetime -= 1
				if (lifetime <= 0)
					ds_list_delete(other.aftimg_list, inst)
				break;
			case after_images.blur:
				image_alpha -= 0.5
				
				if (image_alpha <= 0)
					ds_list_delete(other.aftimg_list, inst)
				break;
		}
		if (obj_fade.fade)
			ds_list_delete(other.aftimg_list, inst)
	}
}
