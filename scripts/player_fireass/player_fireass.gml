function player_fireass()
{
	i_frames = 60
	image_speed = 0.35
	instakill = true
	if scr_hitwall(x + hsp, y)
		image_xscale *= -1
	if sprite_index == spr_player_fireass
	{
		if anim_ended() && sprite_index == spr_player_fireass
			create_effect(x, y + 25, spr_shotgunimpact)
		if particle_timer > 0
			particle_timer--
		else
		{
			particle_timer = 7
			create_effect(x, y + 40, spr_cloudeffect)
		}
		hsp = movespeed
		if p_move != 0
		{
			if (p_move == xscale)
				movespeed = approach(movespeed, (xscale * 8), 0.5)
			else
				movespeed = approach(movespeed, 0, 0.5)
			if (movespeed <= 0)
				xscale = p_move
		}
		else
			movespeed = approach(movespeed, 0, 0.1)
		if grounded && vsp >= 0 && !place_meeting(x, y + 1, obj_ratblock)
		{
			movespeed = 6
			reset_anim(spr_player_fireassground)
		}
	}
	else if sprite_index == spr_player_fireassground
	{
		hsp = xscale * movespeed
		movespeed = approach(movespeed, 0, 0.25)
		if anim_ended()
		{
			movespeed = 0
			state = states.normal
		}
	}
}