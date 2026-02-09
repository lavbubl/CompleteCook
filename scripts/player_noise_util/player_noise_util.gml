function do_spin_cancel()
{
	if !input.up.check
	{
		if p_move != 0
			xscale = p_move
		input_buffers.grab = 0
		state = states.mach2
		movespeed = 12
		jumpstop = true
		vsp = min(vsp, -5)
		reset_anim(spr_playerN_spincancel)
	}
	else
		do_grab() //uppercut
}

function do_crusher()
{
	if input_buffers.jump > 0 && input.up.check
	{
		state = states.crusher
		input_buffers.jump = 0
		vsp = -16
		audio_stop_sound(sfx_N_crusher)
		scr_sound_3d_on(myemitter, sfx_N_crusher)
		reset_anim(spr_playerN_crusher)
	}
}
