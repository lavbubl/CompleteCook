if (sprite_index != spr_bigmushroom_bounce)
{
	with other
	{
		grounded = false;
		jumpstop = true;
		vsp = -14;
		if state == states.slide
			state = states.jump
		if state == states.normal
			state = states.jump
		if state == states.climbwall
			state = states.mach2
		if state == states.jump
			sprite_index = spr_player_superjumpfall
	}
	
	scr_sound_3d(asset_get_index($"sfx_mushroom{irandom_range(1, 3)}"), x, y)
	reset_anim(spr_bigmushroom_bounce)
}