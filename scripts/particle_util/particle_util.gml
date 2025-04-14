enum particles {
	bleh, // unused
	genericpoof, // replace with an even more generic name
	gib,
	stars,
	hurtstar,
	parry,
	taunt,
	machcharge,
	bang,
	yellowstar,
	sparks
}

function particle_create(_x, _y, p_type, _xscale = 1, _yscale = 1, _sprite = noone)
{
	var p = {
		sprite_index: spr_null,
		image_index: 0,
		image_speed: 0.35,
		x: _x,
		y: _y,
		image_xscale: _xscale,
		image_yscale: _yscale,
		image_blend: c_white,
		image_angle: 0,
		image_alpha: 1,
		depth: -10,
		lifetime: -1,
		type: p_type
	}
	
	with p
	{
		switch (p_type)
		{
			case particles.genericpoof:
				sprite_index = spr_genericpoofeffect
				image_speed = 0.35
				break;
			case particles.gib:
			case particles.stars:
				sprite_index = p_type == particles.gib ? spr_gibs : spr_gibstars
				image_index = random_range(0, sprite_get_number(p.sprite_index))
				image_speed = 0
				hsp = irandom_range(6, -6)
				vsp = irandom_range(12, -12)
				image_angle = random_range(0, 360)
				break;
			case particles.hurtstar:
				hsp = random_range(5, 10)
				vsp = random_range(5, 10)
				dir1 = choose(1, -1)
				dir2 = choose(1, -1)
				lifetime = 30
				sprite_index = spr_gibstars
				image_index = random_range(0, 5)
				image_speed = 0
				image_angle = random_range(0, 360)
				depth = -1
				break;
			case particles.yellowstar:
				sprite_index = spr_gibstars
				image_speed = 0
				hsp = random_range(6, -6)
				vsp = random_range(12, -12)
				image_angle = random_range(0, 360)
				break;
			case particles.parry:
				sprite_index = spr_parryflash
				depth = -230
				break;
			case particles.taunt:
				sprite_index = spr_taunteffect
				break;
			case particles.machcharge:
				sprite_index = spr_mach3charge
				image_speed = 0.5
				statetofollow = states.mach3
				break;
			case particles.bang:
				sprite_index = spr_bangeffect
				image_speed = 0.5
				break;
			case particles.sparks:
				sprite_index = spr_supertauntcharge
				image_speed = 1
				break;
		}
	
		if _sprite != noone
			sprite_index = _sprite
	
		image_number = sprite_get_number(p.sprite_index)
	}
	
	with (obj_particlecontroller)
		array_push(particle_list, p)
		
	return p;
}

function particle_contains_sprite(sprite)
{
	for (var i = 0; i < array_length(obj_particlecontroller.particle_list); i++) 
	{
	    var p = obj_particlecontroller.particle_list[i]
		if p.sprite_index == sprite
			return true;
	}
	return false;
}

function create_debris(_x, _y, sprite)
{
	return particle_create(_x, _y, particles.gib, 1, 1, sprite);
}

function create_effect(_x, _y, sprite)
{
	return particle_create(_x, _y, particles.genericpoof, 1, 1, sprite);
}

function create_followingeffect(sprite, state, _xscale = 1)
{
	with particle_create(x, y, particles.machcharge, _xscale, 1, sprite)
		statetofollow = state
}
