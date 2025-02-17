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
	else if (global.panic.active && key_up.pressed && grounded)
	{
		//WIP RESET LEVEL FUNCTION
		with instance_create(0, 0, obj_rank)
			rank_score = global.score + obj_generichandler.combo_score
		global.panic.active = false
		global.combo.timer = 0
		ds_list_clear(global.ds_dead_enemies)
		ds_list_clear(global.ds_saveroom)
		state = states.actor
		reset_anim(spr_player_enterdoor)
		spawn = "a"
		obj_followerhandler.followers = []
		global.combo.started = false
		global.combo.wasted = false
	}
}
