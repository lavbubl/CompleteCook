function player_slide() 
{
	hsp = movespeed * xscale
	
	movespeed = max(movespeed - 0.4, 0);
	
	image_speed = 0.35
	switch sprite_index
	{
		case spr_player_machslideboost:
		case spr_player_machslideboost3:
			var ismach2 = sprite_index == spr_player_machslideboost

			if anim_ended()
			{
				if grounded
				{
					sprite_index = ismach2 ? spr_player_mach2 : spr_player_mach3
					state = ismach2 ? states.mach2 : states.mach3
					movespeed = ismach2 ? 8 : 12
					xscale *= -1
				}
				else
					sprite_index = ismach2 ? spr_player_machslideboostfall : spr_player_machslideboost3fall
			}
			break
		case spr_player_machslideboostfall:
		case spr_player_machslideboost3fall:
			var ismach2 = sprite_index == spr_player_machslideboostfall
			
			if (grounded)
			{
				sprite_index = ismach2 ? spr_player_machslideboost : spr_player_machslideboost3;
				image_index = image_number - 1;
			}
			break
		case spr_player_machslidestart:
			if anim_ended()
				image_speed = 0;
			if (place_meeting(x + xscale, y, obj_solid))
			{
				reset_anim(spr_player_wallsplat)
				scr_sound_3d(sfx_splat, x, y)
				state = states.bump
			}
			if !movespeed
			{
				reset_anim(spr_player_machslideend)
				state = states.normal
			}
			break
	}
	instakill = sprite_index == spr_player_machslideboost3;
}