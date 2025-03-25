switch (state)
{
	case 0:
		if white_fade_alpha < 1
			white_fade_alpha += 0.1
		else
		{
			room_goto(rank_room)
			
			obj_player.spawn = "a"
			x = obj_player.x - obj_camera.campos.x
			y = obj_player.y - obj_camera.campos.y
			
			state++
			
			alarm[0] = 220
			alarm[2] = 630
			
			var ranks = [
				global.rank_milestones.c,
				global.rank_milestones.b,
				global.rank_milestones.a,
				global.rank_milestones.s
			]
			
			if (rank_score >= global.rank_milestones.s && check_p_rank())
				rank_ix = 5
			else
			{
				for (var i = 4; i >= 1; i--) 
				{
					if global.score >= ranks[i - 1]
					{
						rank_ix = i
						break;
					}
				}
			}//can be made redundant and removed as obj_exitgate calculates the rank
			scr_sound(rank_data[rank_ix].song)
		}
		break;
	case 1:
		var tx = screen_w / 2
		var ty = screen_h / 2
		var dir = point_direction(x, y, tx, ty)
		var lx = lengthdir_x(2, dir)
		var ly = lengthdir_y(2, dir)
		x = approach(x, tx, abs(lx))
		y = approach(y, ty, abs(ly))
		break;
	case 2:
		if brown_alpha < 1
			brown_alpha += 0.1
		else
			state++
		break;
	case 3:
		for (var i = 0; i < array_length(toppins); i++) 
		{
			if toppin_ix != i
				toppins[i].image_yscale = max(toppins[i].image_yscale - 0.1, 1)
		}
		
		if (toppin_ix <= array_length(toppins) - 1)
		{
			var cur_toppin = toppins[toppin_ix]
			
			with cur_toppin
			{
				if y <= screen_h
				{
					with other
					{
						toppin_ix++
						if toppin_ix == array_length(toppins) - 1
							alarm[3] = 40
					}
					y = screen_h
				}
				else
				{
					if y == other.t_ystart
						scr_sound(sfx_spin)
					y -= 20
					image_yscale = 1.2
				}
			}
		}
		break;
}

if room != rank_room && sprite_index == rank_data[rank_ix].sprite
	instance_destroy()
