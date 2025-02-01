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
		if (sprite_index == spr_player_holdjump || sprite_index == spr_player_holdfall)
			reset_anim(spr_player_holdland)
		if (sprite_index != spr_player_holdland && sprite_index != spr_player_holdrise)
			sprite_index = p_move != 0 ? spr_player_holdmove : spr_player_holdidle
	}
	else
	{
		if (sprite_index != spr_player_holdjump && sprite_index != spr_player_holdfall)
			reset_anim(spr_player_holdjump)
		if (!jumpstop && !key_jump.down && vsp < 0)
		{
			jumpstop = true
			vsp /= 10
		}
	}
	
	if (coyote_time && key_jump.pressed)
	{
		vsp = -12
		jumpstop = false
		scr_sound_3d(sfx_jump, x, y)
	}
		
	if p_move != 0
		xscale = p_move
	
	image_speed = 0.35
	switch (sprite_index)
	{
		case spr_player_holdland:
		case spr_player_holdrise:
			reset_anim_on_end(spr_player_holdidle)
			break;
		case spr_player_holdjump:
			reset_anim_on_end(spr_player_holdfall)
			break;
	}
	
	if (key_attack.pressed)
	{
		state = states.punchenemy
		var str = string_concat("spr_player_finishingblow_", string(irandom_range(1, 5)))
		reset_anim(asset_get_index(str))
		if (key_up.down)
			reset_anim(spr_player_finishingblowup)
	}
}