function afterimage_create(a_type)
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
		effect: a_type
	}
	switch (a_type)
	{
		case after_images.mach:
			inst.image_blend = choose(c_red, c_lime)
			inst.lifetime = 15
			break;
		case after_images.blur:
			inst.image_alpha = 2
			inst.hsp = hsp
			inst.vsp = vsp
			break;
	}
	with (obj_afterimagecontroller)
		ds_list_add(aftimg_list, inst)
}

function do_afterimage(timer, reset_point, effect, spd = 1)
{
	if (timer > 0)
		timer--
	else
	{
		afterimage_create(effect)
		timer = reset_point
	}
}
