if (state != states.grabbed && other.state != states.handstandjump && state != states.stun && (state == states.chase or state == states.walk))
	scr_hurtplayer(other)
