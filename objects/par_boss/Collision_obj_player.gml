with other
{
	if (i_frames <= 0 && state != states.parry && state != states.taunt && other.hurtplayer)
		do_hurt(other)
}
