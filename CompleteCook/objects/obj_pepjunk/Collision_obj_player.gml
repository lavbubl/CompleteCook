if (!noisethrow)
	event_inherited()
else
{
	var s = other.state
	scr_hurtplayer(other)
	if (s != other.state)
	{
		with (obj_noiseboss)
			state = states.walk
		hsp = (image_xscale * 5)
		vsp = -11
		use_collision = 0
	}
}
