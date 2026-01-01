function player_bump() 
{
	image_speed = 0.35
	if sprite_index == spr_playerP_wallsplat || 
	   sprite_index == spr_playerP_ceilinghit || 
	   sprite_index == spr_playerP_bodyslamland ||
	   sprite_index == spr_playerP_poundcancel2 ||
	   sprite_index == spr_playerP_shotgun_shootdownland
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
		if (sprite_index == spr_playerP_bodyslamland || sprite_index == spr_playerP_freefallland)
			reset_anim(spr_playerP_facehurt)
		else if (sprite_index == spr_playerP_ceilinghit)
		{
			reset_anim(spr_playerP_machfreefall)
			state = states.jump
		}
		else
			sprite_index = spr_playerP_idle
	}
}