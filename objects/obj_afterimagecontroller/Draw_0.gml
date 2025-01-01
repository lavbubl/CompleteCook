for (var inst = 0; inst < array_length(aftimg_insts); inst++) 
{
	var inst_id = aftimg_insts[inst]
	
	switch (inst_id.effect)
	{
		case after_images.mach:
			inst_id.image_alpha = round(sin(inst_id.lifetime * 1.2)) * (obj_player.movespeed / 12)
			var s = obj_player.state
			if (s != states.mach2 && s != states.mach3)
				inst_id.image_alpha = 0
			break;
		case after_images.blur:
			shader_set(shd_blur)
			quick_shader_set_uniform_f(shd_blur, "h", abs(inst_id.hsp) >= abs(inst_id.vsp))
			break;
	}
	
	with (inst_id)
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
	
	if (shader_current() != -1)
		shader_reset()
}
