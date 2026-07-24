with other
{
	if (i_frames <= 0 && state != states.parry && !tauntinv && other.hurtplayer)
		do_hurt(other)
}
