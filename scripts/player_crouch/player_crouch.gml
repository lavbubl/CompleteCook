function player_crouch()
{
	var crouchspr = spr_player_crouch
	var crouchdownspr = spr_player_crouchdown
	var crouchfallspr = spr_player_crouchfall
	var crouchmovespr = spr_player_crawl
	
	if has_shotgun
	{
		crouchspr = spr_player_shotgun_crouch
		crouchdownspr = spr_player_shotgun_crouchstart
		crouchfallspr = spr_player_shotgun_crouchfall
		crouchmovespr = spr_player_shotgun_crouchmove
	} //FUUUUUUUUUUUUUUUUCK
	
	if p_move != 0
		xscale = p_move
	hsp = p_move * 4
	image_speed = 0.4
	
	if !grounded
	{
		if sprite_index != crouchfallspr
			reset_anim(crouchfallspr)
		
		if anim_ended()
			image_index = crouchfallspr == spr_player_crouchfall ? image_number - 7 : image_number - 1
	}
	else
	{
		if sprite_index == crouchfallspr
			reset_anim(crouchdownspr)
		
		if sprite_index == crouchdownspr
			reset_anim_on_end(crouchspr)
		
		if sprite_index != crouchdownspr
			sprite_index = p_move != 0 ? crouchmovespr : crouchspr
		
		if (coyote_time && input_buffers.jump > 0 && scr_can_uncrouch())
		{
			input_buffers.jump = 0
			vsp = -8 //-8 not -12
			scr_sound_3d(sfx_jump, x, y)
		}
	}
	
	if !input.down.check && scr_can_uncrouch() && grounded && vsp >= 0
		state = states.normal
}