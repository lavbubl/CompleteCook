function player_crouch()
{
	if p_move != 0
		xscale = p_move
	hsp = p_move * 4
	image_speed = 0.4
	
	if (!(grounded && vsp >= 0))
	{
		if sprite_index != spr_player_crouchfall
			reset_anim(spr_player_crouchfall)
		
		if anim_ended()
			image_index = 5
	}
	else
	{
		if sprite_index == spr_player_crouchfall
			reset_anim(spr_player_crouchdown)
			
		if sprite_index == spr_player_crouchdown
			reset_anim_on_end(spr_player_crouch)
		
		if (sprite_index != spr_player_crouchdown)
			sprite_index = p_move != 0 ? spr_player_crawl : spr_player_crouch
	
		if (coyote_time && key_jump.pressed && !scr_solid(x, y - 16))
		{
			vsp = -12
			scr_sound_3d(sfx_jump, x, y)
		}
	}
	
	if !key_down.down && !scr_solid(x, y - 16) && grounded && vsp >= 0
		state = states.normal
}