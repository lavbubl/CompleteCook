function player_crouch()
{
	var crouchspr = spr_player_crouch
	var crouchdownspr = spr_player_crouchdown
	var crouchjumpspr = spr_player_crouchjump
	var crouchfallspr = spr_player_crouchfall
	var crouchmovespr = spr_player_crawl
	
	if has_shotgun
	{
		crouchspr = spr_player_shotgun_crouch
		crouchdownspr = spr_player_shotgun_crouchstart
		crouchjumpspr = spr_player_shotgun_crouchjump
		crouchfallspr = spr_player_shotgun_crouchfall
		crouchmovespr = spr_player_shotgun_crouchmove
	}
	
	if P_MOVE != 0
		xscale = P_MOVE
	hsp = P_MOVE * 4
	image_speed = 0.45
	
	if !grounded
	{
		if sprite_index != crouchjumpspr && sprite_index != crouchfallspr
			reset_anim(crouchjumpspr)
		
		if sprite_index == crouchjumpspr
			reset_anim_on_end(crouchfallspr)
	}
	else
	{
		if sprite_index == crouchfallspr
		{
			reset_anim(crouchdownspr)
			scr_sound_3d_pitched(sfx_step, x, y)
		}
		
		if sprite_index == crouchdownspr
			reset_anim_on_end(crouchspr)
		
		if sprite_index != crouchdownspr
			sprite_index = P_MOVE != 0 ? crouchmovespr : crouchspr
		
		if (coyote_time && input_buffers.jump > 0 && scr_can_uncrouch())
		{
			input_buffers.jump = 0
			vsp = -8
			scr_sound_3d(sfx_jump, x, y)
		}
	}
	
	if !input_direction_check(INPUTS.down) && scr_can_uncrouch() && grounded && vsp >= 0
	{
		if P_MOVE = 0
			sprite_index = crouchdownspr	
		state = states.normal
	}
}
