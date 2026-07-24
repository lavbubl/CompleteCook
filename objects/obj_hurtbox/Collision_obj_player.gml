if !instance_exists(follow_obj) || other.state == states.noclip
	exit;
	
inactive = follow_obj.state == states.stun || follow_obj.state == states.scared || follow_obj.escape_frozen

with other
{
	if (i_frames <= 0 && state != states.parry && !tauntinv && !other.inactive)
		do_hurt(other)
}
