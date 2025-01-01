function afterimage_create(afterimage)
{
	var inst = {
		sprite_index: self.sprite_index,
		image_index: self.image_index,
		x: self.x,
		y: self.y,
		image_xscale: self.xscale,
		image_yscale: self.image_yscale,
		image_angle: self.image_angle,
		image_blend: self.image_blend,
		image_alpha: self.image_alpha,
		effect: afterimage
	}
	switch (afterimage)
	{
		case after_images.mach:
			inst.image_blend = choose(c_red, c_lime)
			inst.lifetime = 8
			break;
		case after_images.blur:
			inst.image_alpha = 4
			inst.hsp = hsp
			inst.vsp = vsp
			break;
	}
	with (obj_afterimagecontroller)
		array_push(aftimg_insts, inst)
}