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
		with instance_create(0, 0, obj_rank)
			rank_score = global.score + obj_generichandler.combo_score
	}
}
