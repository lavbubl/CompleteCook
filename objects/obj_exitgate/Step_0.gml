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
	if (global.panic.active && key_up.pressed)
	{
		//WIP RESET LEVEL FUNCTION
		global.panic.active = false
		global.combo.timer = 0
		global.level_data.treasure = false
		ds_list_clear(global.ds_dead_enemies)
		ds_list_clear(global.ds_broken_destroyables)
		ds_list_clear(global.ds_secrets)
		do_fade(tower_1, "a", fade_types.door)
		scr_sound(super_mario_64_teleport_sfx)
		state = states.actor
		reset_anim(spr_player_enterdoor)
		spawn = "a"
	}
}
