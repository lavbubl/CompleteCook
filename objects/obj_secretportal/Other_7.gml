if ((sprite_index == spr_secretportal_enter || sprite_index == spr_secretportal_spawnclose) && image_speed != 0)
{
	if ds_list_find_index(global.ds_saveroom, id) == -1
	{
		image_index = image_number - 1
		image_speed = 0
		do_secret_fade()
		ds_list_add(global.ds_saveroom, id)
		global.secret = !global.secret
	}
	else
		instance_destroy()
}

if sprite_index == spr_secretportal_spawn
{
	alarm[0] = 120
	reset_anim(spr_secretportal_spawnidle)
	scr_sound_3d(sfx_secretexit, x, y)
	with obj_player
	{
		secret_exit = false
		secret_cutscene = false
	}
}
