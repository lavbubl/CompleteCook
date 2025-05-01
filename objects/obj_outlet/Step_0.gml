with obj_player
{
	if ((place_meeting(x + 1, y + 1, other) || place_meeting(x - 1, y - 1, other)) && i_frames <= 0)
		do_hurt(other)
}
