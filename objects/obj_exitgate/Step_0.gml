with instance_place(x, y, obj_player)
{
	if (!global.panic.active && anim_ended() && sprite_index == spr_player_walkfront && !global.panic.active)
	{
		shake_camera()
		reset_anim(spr_player_timesup)
		other.image_index = 1
		scr_sound_3d(sfx_groundpound, x, y)
		global.doorshut = true
	}
	else if (global.panic.active && key_up.down && grounded && state != states.taunt)
	{
		global.panic.active = false
		state = states.actor
		reset_anim(spr_player_lookdoor)
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
		
		ini_open(global.savestring)
		
		var lvl_name = global.level_data.level_name
		var lvl_toppins = global.level_data.toppins
		
		if s > ini_read_real(lvl_name, "score", 0)
			ini_write_real(lvl_name, "score", s)
		
		if !ini_read_real(lvl_name, "treasure", 0)
			ini_write_real(lvl_name, "treasure", global.level_data.treasure)
		
		if global.level_data.secret_count > ini_read_real(lvl_name, "secret_count", 0)
			ini_write_real(lvl_name, "secret_count", global.level_data.secret_count)
		
		if rank_ix > ini_read_real(lvl_name, "rank", 0)
			ini_write_real(lvl_name, "rank", rank_ix)
		
		if !ini_read_real(lvl_name, "shroom", 0)
			ini_write_real(lvl_name, "shroom", lvl_toppins.shroom)
		if !ini_read_real(lvl_name, "cheese", 0)
			ini_write_real(lvl_name, "cheese", lvl_toppins.cheese)
		if !ini_read_real(lvl_name, "tomato", 0)
			ini_write_real(lvl_name, "tomato", lvl_toppins.tomato)
		if !ini_read_real(lvl_name, "sausage", 0)
			ini_write_real(lvl_name, "sausage", lvl_toppins.sausage)
		if !ini_read_real(lvl_name, "pineapple", 0)
			ini_write_real(lvl_name, "pineapple", lvl_toppins.pineapple)
		
		ini_close()
	}
}
