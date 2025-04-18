if follow_obj != -4
	inactive = follow_obj.state == states.stun || follow_obj.state == states.scared || follow_obj.escape_frozen

with other
{
	if (i_frames <= 0 && state != states.parry && state != states.taunt && !other.inactive)
		do_hurt(other)
}
  