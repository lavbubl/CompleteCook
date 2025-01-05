enum e_states {
	normal,
	scared,
	grabbed,
	stun
}

function enemy_normal()
{
	image_speed = 0.35
	
	movespeed = 1
	hsp = movespeed * image_xscale
	
	if (place_meeting(x + image_xscale, y, obj_solid))
		image_xscale *= -1
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
	image_xscale = -obj_player.xscale
}

function enemy_stun()
{
	hsp = approach(hsp, 0, 0.01)
	sprite_index = sprs.stun
	image_speed = 0.35
}

function do_scared()
{
	if scared_timer > 0
		scared_timer--
	else if (obj_player.state == states.mach3)
	{
		state = e_states.scared
		hsp = 0
		vsp = -5
		movespeed = 0
		sprite_index = sprs.scared
		image_xscale = obj_player.x > x ? 1 : -1
		scared_timer = 180
	}
}
