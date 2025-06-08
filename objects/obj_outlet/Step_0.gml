with obj_player
{
	if ((place_meeting(x + 2, y + 2, other) || place_meeting(x - 2, y - 2, other)) && i_frames <= 0)
		do_hurt(other)
}
