function player_wallbounce() {
	hsp = movespeed
	
	if sprite_index == spr.divebomb || sprite_index == spr.divebombfall || sprite_index == spr.divebombland
	{
		if p_move != 0
			movespeed = approach(movespeed, p_move * max(12, abs(movespeed)))
		else
			movespeed = approach(movespeed, 0, 0.125)
		
		var xx = movespeed == 0 ? xscale : movespeed
		
		if grounded && vsp > 0 && scr_solid(x + xx, y)
		{
			mask_index = mask_player_small
			
			if scr_solid(x + xx, y)
			{
				state = states.tumble
				sprite_index = spr_playerP_machroll
				image_index = 0
				instance_destroy(instance_place(x + xx, y, obj_destroyable))
				
				if movespeed != 0
					xscale = sign(movespeed)
				
				movespeed = max(abs(movespeed), 6)
			}
			
			mask_index = mask_player
		}
	}
	else if p_move != 0 
		movespeed = approach(movespeed, p_move * 8)
	else
		movespeed = approach(movespeed, 0, 0.125)
	
}