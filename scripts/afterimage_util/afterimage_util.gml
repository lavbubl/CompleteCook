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
			inst.image_blend = choose(obj_afterimagecontroller.mach_color1, obj_afterimagecontroller.mach_color2)
			inst.lifetime = 10
			break;
		case after_images.blur:
			inst.image_alpha = 0.8
			inst.hsp = hsp
			inst.vsp = vsp
			break;
	}
	with (obj_afterimagecontroller)
		array_push(aftimg_list, inst)
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
