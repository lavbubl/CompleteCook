depth = 0
obj_particlecontroller_close.postdraw_list = []
for (var p = 0; p < array_length(particle_list); p++) 
{
	var p_id = particle_list[p]
	if p_id.depth <= -100
	{
		array_push(obj_particlecontroller_close.postdraw_list, p_id)
		continue;
	}
	with p_id
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
}
