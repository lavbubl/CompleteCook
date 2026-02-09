function player_divebomb()
{
	var _spd = 12
	
	if p_move != sign(movespeed) || abs(movespeed) < _spd
		movespeed = approach(movespeed, p_move != 0 ? p_move * _spd : 0, p_move != 0 ? 1 : 0.25)
	
	hsp = movespeed
	var _x = x + sign(movespeed)
	
	if input_buffers.grab > 0
	{
		input_buffers.grab = 0
		do_spin_cancel()
	}
	else if grounded
	{
		if !input.down.check
		{
			vsp = -7
			state = states.wallbounce
			sprite_index = spr_playerN_wallbounce
		}
		else if vsp >= 0 && scr_hitwall(_x, y)
		{
			mask_index = mask_player_small;
			if !scr_hitwall(_x, y) || place_meeting(_x, y, obj_destroyable)
			{
				state = states.tumble
				sprite_index = spr_player_machroll
				if sign(movespeed) != 0
					xscale = sign(movespeed)
				movespeed = max(abs(movespeed), 6)
			}
			mask_index = mask_player;
		}
		if sprite_index == spr_playerN_divebombfall
			reset_anim(spr_playerN_divebombland)
	}
	else if sprite_index != spr_playerN_divebombfall
	{
		sprite_index = spr_playerN_divebombfall
		vsp = 20
	}
	
	if sprite_index == spr_playerN_divebombland && anim_ended()
		sprite_index = spr_playerN_divebomb
	
	image_speed = (abs(movespeed) / 40) + 0.4
	
	do_crusher()
	
	do_taunt()
	
	instakill = true
}
