enum e_states {
	normal,
	scared,
	grabbed,
	stun,
	hit
}

function enemy_normal()
{
	image_speed = 0.35
	
	movespeed = 1
	hsp = movespeed * xscale
	
	if (place_meeting(x + xscale, y, obj_solid) || !scr_solid(x + hsp, y + 4))
		xscale *= -1
}

function enemy_scared()
{
	if (scared_timer <= 0)
	{
		state = states.normal
		sprite_index = sprs.move
	}
}

function enemy_grabbed()
{
	hsp = 0
	sprite_index = sprs.stun
	image_speed = 0.35
}

function enemy_stun()
{
	hsp = approach(hsp, 0, 0.4)
	sprite_index = sprs.stun
	image_speed = 0.35
	if (stun_timer <= 0)
	{
		state = states.normal
		sprite_index = sprs.move
	}
	else
		stun_timer--
}

function enemy_hit()
{
	sprite_index = sprs.dead
	if (place_meeting(x + hsp, y + vsp, obj_solid))
		instance_destroy()
	if (place_meeting(x + hsp, y, obj_solid) && scr_slope(x, y + 1))
	{
		hsp = 0
		vsp = -20
	}
}

function do_scared()
{
	if scared_timer > 0
		scared_timer--
	else if (obj_player.state == states.mach3 && distance_to_object(obj_player) < 200 && state != e_states.hit)
	{
		state = e_states.scared
		hsp = 0
		vsp = -5
		movespeed = 0
		sprite_index = sprs.scared
		xscale = obj_player.x > x ? 1 : -1
		scared_timer = 180
	}
}

function do_enemygibs()
{
	particle_create(x, y, particles.bang)
	particle_create(x, y, particles.parry)
	repeat (3)
	{
		particle_create(x, y, particles.gib)
		particle_create(x, y, particles.stars)
	}
}
