function player_slide() 
{
	hsp = movespeed * xscale
	
	movespeed = max(movespeed - 0.4, 0);
	
	image_speed = 0.35
	switch sprite_index
	{
		case spr_playerP_machslideboost:
		case spr_playerP_machslideboost3:
			var ismach2 = sprite_index == spr_playerP_machslideboost

			if anim_ended()
			{
				if grounded
				{
					sprite_index = ismach2 ? spr_playerP_mach2 : spr_playerP_mach3
					state = ismach2 ? states.mach2 : states.mach3
					movespeed = ismach2 ? 8 : 12
					xscale *= -1
				}
				else
					sprite_index = ismach2 ? spr_playerP_machslideboostfall : spr_playerP_machslideboost3fall
			}
			break
		case spr_playerP_machslideboostfall:
		case spr_playerP_machslideboost3fall:
			var ismach2 = sprite_index == spr_playerP_machslideboostfall
			
			if (grounded)
			{
				sprite_index = ismach2 ? spr_playerP_machslideboost : spr_playerP_machslideboost3;
				image_index = image_number - 1;
			}
			break
		case spr_playerP_machslidestart:
			if anim_ended()
				image_index = image_number - 4
			if scr_hitwall(x + xscale, y)
			{
				reset_anim(spr_playePr_wallsplat)
				scr_sound_3d(sfx_splat, x, y)
				state = states.bump
			}
			if !movespeed
			{
				reset_anim(spr_playerP_machslideend)
				state = states.normal
			}
			break
	}
	
	if grounded && !particle_contains_sprite(spr_dashcloud)
	{
		with create_effect(x, y, spr_dashcloud)
			image_xscale = other.xscale
	}
	
	instakill = sprite_index == spr_playerP_machslideboost3;
}