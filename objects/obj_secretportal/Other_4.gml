if ds_list_find_index(global.ds_saveroom, id) != -1
{
	if place_meeting(x, y, obj_player)
	{
		reset_anim(spr_secretportal_spawn)
		state = 1
		scr_sound_3d(sfx_secretexit, x, y)
	}
	else
		instance_destroy()
}
