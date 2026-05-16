function player_defeat()
{
	hsp = xscale * movespeed
	if grounded
	{
		if sprite_index != spr_player_defeatland && sprite_index != spr_player_defeatland_loop
		{
			image_speed = 0.35
			reset_anim(spr_player_defeatland)
		}
		movespeed = approach(movespeed, 0, 0.5)
	}
	
	if place_meeting(x + sign(hsp), y, obj_solid)
		xscale *= -1
	
	if anim_ended()
	{
		switch sprite_index
		{
			case spr_player_defeat:
				reset_anim(spr_player_defeat_loop)
				break;
			case spr_player_defeatland:
				reset_anim(spr_player_defeatland_loop)
				break;
		}
	}
}