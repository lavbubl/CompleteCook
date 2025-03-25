with instance_place(x, y, obj_player)
{
	if (!global.panic.active && anim_ended() && sprite_index == spr_player_exitdoor && !global.panic.active)
	{
		shake_camera()
		reset_anim(spr_player_timesup)
		other.image_index++
		scr_sound_3d(sfx_groundpound, x, y)
		global.doorshut = true
	}
	else if (global.panic.active && key_up.down && grounded)
	{
		global.panic.active = false
		state = states.actor
		reset_anim(spr_player_enterdoor)
		hsp = 0
		movespeed = 0
		
		var s = round(global.score + obj_generichandler.combo_score)
		
		with instance_create(0, 0, obj_rank)
		{
			rank_score = s
			results[3][1] = global.combo.record
		}
		
		var rank_ix = 0
		
		var ranks = [
			global.rank_milestones.c,
			global.rank_milestones.b,
			global.rank_milestones.a,
			global.rank_milestones.s
		]

		if (s >= global.rank_milestones.s && check_p_rank())
			rank_ix = 5
		else
		{
			for (var i = 4; i >= 1; i--) 
			{
				if s >= ranks[i - 1]
				{
					rank_ix = i
					break;
				}
			}
		}
		
		ini_open($"saves/saveData{global.savefile}.ini")
		
		var lvl_name = global.level_data.level_name
		
		if s > ini_read_real(lvl_name, "score", 0)
			ini_write_real(lvl_name, "score", s)
		ini_write_real(lvl_name, "treasure", global.level_data.treasure)
		ini_write_real(lvl_name, "secret_count", global.level_data.secret_count)
		ini_write_real(lvl_name, "rank", rank_ix)
		
		ini_close()
	}
}
