var inactive = false

if (follow_obj != -4)
	inactive = follow_obj.state == e_states.stun || follow_obj.state == e_states.scared

with other
{
	if (i_frames <= 0 && state != states.parry && !inactive)
		do_hurt(other)
}
