with other
{
	if sprite_index != spr_player_presentboxspring && !(sprite_index == spr_player_rockethitwall && state == states.groundpound)
	{
		with other
			reset_anim(spr_spring)
		x = other.x
		scr_sound_3d(sfx_superspring, x, y)
		var follow_state = states.superjump
		hsp = 0
		movespeed = 0
		if other.image_yscale >= 0
		{
			var h = bbox_bottom - y
			y = other.y - h
			state = states.superjump
			sprite_index = spr_player_presentboxspring
			vsp = -10
		}
		else
		{
			follow_state = states.groundpound
			y = other.y
			state = states.groundpound
			freefallsmash = -14
			vsp = 10
			sprite_index = spr_player_rockethitwall
			repeat 5
				instance_create(other.x, other.y + 40, obj_bubbles)
			scr_sound_3d(sfx_bottlepop, x, y)
		}
		var fe = create_followingeffect(spr_speedlines_vertical, follow_state)
		if follow_state == states.superjump
			fe.image_yscale = -1
	}
}
