if state == 0
{
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
		alarm[1] = 800
		
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
		}
		scr_sound(rank_data[rank_ix].song)
	}
}
else
{
	var tx = screen_w / 2
	var ty = screen_h / 2
	var dir = point_direction(x, y, tx, ty)
	var lx = lengthdir_x(2, dir)
	var ly = lengthdir_y(2, dir)
	x = approach(x, tx, abs(lx))
	y = approach(y, ty, abs(ly))
}

if room != rank_room && sprite_index == rank_data[rank_ix].sprite
	instance_destroy()
