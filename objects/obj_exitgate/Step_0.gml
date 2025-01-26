with instance_place(x, y, obj_player)
{
	if (anim_ended() && sprite_index == spr_player_exitdoor)
	{
		shake_camera()
		reset_anim(spr_player_timesup)
		other.image_index++
		scr_sound(sfx_groundpound)
		global.doorshut = true
	}
}
