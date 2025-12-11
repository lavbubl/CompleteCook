with obj_player
{
	var can_bump = state == states.mach2 ||
				   state == states.mach3 ||
				   state == states.grab ||
				   state == states.tumble
	if place_meeting(x + xscale, y, other) && can_bump
	{
		sprite_index = spr_playerP_bump
		state = states.bump
		hsp = 5 * -xscale
		vsp = -5
		grounded = false
		scr_sound_3d(sfx_bumpwall, x, y)
		with other
			reset_anim(sprs.bump)
	}
}
