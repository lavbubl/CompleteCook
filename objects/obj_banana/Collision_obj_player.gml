with other
{
	vsp = -11
	movespeed = min(movespeed + 2, 14)
	state = states.slip
	scr_sound_3d(sfx_slip, x, y)
	reset_anim(spr_player_slipbanana1)
	instance_destroy(other)
}
