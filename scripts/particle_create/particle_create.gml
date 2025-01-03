function particle_create(_x, _y, p_type, _xscale = 1, _yscale = 1)
{
	var p = {
		sprite_index: spr_null,
		image_index: 0,
		image_speed: 0.35,
		x: _x,
		y: _y,
		image_xscale: _xscale,
		image_yscale: _yscale,
		type: p_type
	}
	switch (p_type)
	{
		case particles.bleh:
			p.sprite_index = particle_1
			break;
	}
	p.image_number = sprite_get_number(p.sprite_index)
	with (obj_particlecontroller)
		ds_list_add(particle_list, p)
}