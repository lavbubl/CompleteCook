function player_bump() 
{
	image_speed = 0.35
	if (sprite_index == spr_player_wallsplat || sprite_index == spr_player_ceilinghit)
	{
		hsp = 0
		vsp = 0
	}
	movespeed = 0
	if (grounded)
		hsp = 0
	if anim_ended()
	{
		state = states.normal
		if (sprite_index == spr_player_bodyslamland || sprite_index == spr_player_freefallland)
			reset_anim(spr_player_facehurt)
		else if (sprite_index == spr_player_ceilinghit)
		{
			reset_anim(spr_player_machfreefall)
			state = states.jump
		}
		else
			sprite_index = spr_player_idle
	}
}