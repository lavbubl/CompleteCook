var inactive = false

if (follow_obj != -4)
	inactive = follow_obj.state == states.stun || follow_obj.state == states.scared

with other
{
	if (i_frames <= 0 && state != states.parry && state != states.taunt && !inactive)
		do_hurt(other)
}
