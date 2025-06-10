function player_hold()
{
	if (p_move != 0)
	{
		movespeed = approach(movespeed, 6, 0.5)
		xscale = p_move
	}
	else
		movespeed = 0
		
	hsp = movespeed * xscale
	
	if grounded
	{
		if (sprite_index == spr_player_haulingjump || sprite_index == spr_player_haulingfall)
			reset_anim(spr_player_haulingland)
		if (sprite_index != spr_player_haulingland && sprite_index != spr_player_haulingrise)
			sprite_index = p_move != 0 ? spr_player_haulingmove : spr_player_haulingidle
	}
	else
	{
		if (sprite_index != spr_player_haulingjump && sprite_index != spr_player_haulingfall)
			reset_anim(spr_player_haulingjump)
		if (!jumpstop && !input.jump.check && vsp < 0)
		{
			jumpstop = true
			vsp /= 10
		}
	}
	
	if (coyote_time && input_buffers.jump > 0)
	{
		input_buffers.jump = 0
		vsp = -12
		jumpstop = false
		scr_sound_3d(sfx_jump, x, y)
	}
		
	if p_move != 0
		xscale = p_move
	
	image_speed = 0.35
	switch (sprite_index)
	{
		case spr_player_haulingland:
		case spr_player_haulingrise:
			reset_anim_on_end(spr_player_haulingidle)
			break;
		case spr_player_haulingjump:
			reset_anim_on_end(spr_player_haulingfall)
			break;
	}
	
	if input_buffers.grab > 0
	{
		input_buffers.grab = 0
		state = states.punchenemy
		var str = $"spr_player_finishingblow{string(irandom_range(1, 5))}"
		reset_anim(asset_get_index(str))
		if (input.up.check)
			reset_anim(spr_player_uppercutfinishingblow)
	}
}