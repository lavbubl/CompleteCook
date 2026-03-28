depth = 0
obj_particlecontroller_close.postdraw_list = []
for (var p = 0; p < array_length(particle_list); p++) 
{
	var p_id = particle_list[p]
	if !p_id.visible
		continue;
	else if p_id.depth <= -100
	{
		array_push(obj_particlecontroller_close.postdraw_list, p_id)
		continue;
	}
	with p_id
	{
		if type != particles.genericpoof || image_index < image_number //prevent error of first frames showing on this type of effect
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
		image_index += image_speed
	}
}
