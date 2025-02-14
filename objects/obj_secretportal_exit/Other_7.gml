if sprite_index == spr_secretportal_spawn
{
	alarm[0] = 120
	reset_anim(spr_secretportal_spawnidle)
	with obj_player
	{
		state = states.groundpound
		secret_exit = false
		movespeed = 0
		vsp = 10
	}
}

if sprite_index == spr_secretportal_spawnclose
	instance_destroy()

