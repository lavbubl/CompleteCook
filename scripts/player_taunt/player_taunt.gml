function player_taunt()
{
	hsp = 0
	vsp = 0
	
	var endtaunt = false
	
	if !string_starts_with(sprite_get_name(sprite_index), "spr_player_supertaunt")
	{
		if input.up.check && supertauntshow
		{
			reset_anim(asset_get_index($"spr_player_supertaunt{irandom_range(1, 4)}"))
			scr_sound_3d(sfx_supertaunt, x, y)
			var spds = [[0, -1], [1, -1], [1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0], [-1, -1]]
			var i = 0
			var spd = 20
			repeat 8
			{
				with particle_create(x, y, particles.sparks)
				{
					hsp = spds[i][0] * spd
					vsp = spds[i][1] * spd
				}
				i++
			}
			exit;
		}
		
		if taunttimer > 0
			taunttimer--
		else
			endtaunt = true
	}
	else
	{
		supertauntcount = 0
		supertauntshow = false
		shake_camera(4, 5 / room_speed)
		image_speed = 0.4
		
		if anim_ended()
		{
			endtaunt = true
			with par_enemy
			{
				if (bbox_in_camera() && enemy_can_die())
					instance_destroy()
			}
		}
	}
	
	if endtaunt
	{
		state = prev.state
		vsp = prev.vsp + grav
		sprite_index = prev.sprite_index
	}
}
