if (state == states.walk && (!other.brick) && other.state == states.ratmountpunch)
{
	var s = other.state
	scr_hurtplayer(other)
	if (s != other.state)
	{
		if (state == states.walk)
		{
			state = states.punch
			sprite_index = spr_playerN_spin
			image_index = 0
		}
	}
}
