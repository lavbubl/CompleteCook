enum particles {
	bleh,
	genericpoof,
	gib,
	stars,
	parry,
	taunt
}

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
		case particles.genericpoof:
			p.sprite_index = spr_genericpoofeffect
			break;
		case particles.gib:
		case particles.stars:
			p.sprite_index = p_type == particles.gib ? spr_gibs : spr_gibstars
			p.image_index = random_range(0, sprite_get_number(p.sprite_index))
			p.image_speed = 0
			p.hsp = irandom_range(6, -6)
			p.vsp = irandom_range(12, -12)
			p.image_angle = random_range(0, 360)
			break;
		case particles.parry:
			p.sprite_index = spr_parryflash
			break;
		case particles.taunt:
			p.sprite_index = spr_taunteffect
			break;
	}
	p.image_number = sprite_get_number(p.sprite_index)
	with (obj_particlecontroller)
		ds_list_add(particle_list, p)
}