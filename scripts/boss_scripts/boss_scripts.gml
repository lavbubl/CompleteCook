function boss_stun()
{
	if grounded
	{
		if vulnerable
			hsp = approach(hsp, 0, 0.25)
		else
			vsp = -5
	}
	sprite_index = sprs.stun
	image_speed = 0.35
	if (stun_timer <= 0 && grounded)
	{
		sprite_index = sprs.move
		state = states.normal
		hsp = 0
		vulnerable = false
	}
	else
		stun_timer--
}

function boss_hit()
{
	sprite_index = sprs.dead
	if (place_meeting(x + 1, y, obj_solid) || place_meeting(x - 1, y, obj_solid))
	{
		xscale *= -1
		event_perform(ev_alarm, 0)
	}
}
