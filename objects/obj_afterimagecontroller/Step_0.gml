for (var inst = 0; inst < array_length(aftimg_insts); inst++) 
{
	var inst_id = aftimg_insts[inst]
	
	switch (inst_id.effect)
	{
		case after_images.mach:
			inst_id.lifetime -= 1
			if (inst_id.lifetime <= 0)
				array_delete(aftimg_insts, inst, 1)
			break;
		case after_images.blur:
			inst_id.image_alpha -= 0.5
			if (inst_id.image_alpha <= 0)
				array_delete(aftimg_insts, inst, 1)
			break;
	}
}
