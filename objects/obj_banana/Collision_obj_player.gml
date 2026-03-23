with other
{
	vsp = -11
	movespeed = min(movespeed + 2, 14)
	state = states.slip
	fmod_studio_event_instance_oneshot_3d("event:/sfx/player/slip", x, y)
	reset_anim(spr_player_slipbanana1)
	instance_destroy(other)
}
