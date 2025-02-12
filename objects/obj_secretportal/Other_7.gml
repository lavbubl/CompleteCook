if ((sprite_index == spr_secretportal_enter || sprite_index == spr_secretportal_spawnclose) && image_speed != 0)
{
	if ds_list_find_index(global.ds_secrets, id) == noone
	{
		image_index = image_number - 1
		image_speed = 0
		do_secret_fade()
		ds_list_add(global.ds_secrets, id)
	}
	else
		instance_destroy()
}

if sprite_index == spr_secretportal_spawn
{
	alarm[0] = 120
	reset_anim(spr_secretportal_spawnidle)
	with obj_player
	{
		state = states.groundpound
		secret_exit = false
		secret_cutscene = false
		movespeed = 0
		vsp = 10
	}
}
