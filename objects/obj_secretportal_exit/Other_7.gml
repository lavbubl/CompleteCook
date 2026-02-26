if sprite_index == spr_secretportal_spawn
{
	alarm[0] = 120
	reset_anim(spr_secretportal_spawnidle)
	scr_sound_3d(sfx_secretexit, x, y)
	with obj_player
	{
		/*state = states.groundpound
		secret_exit = false
		movespeed = 0
		vsp = 10*/
		secret_cutscene = false
		secret_exit = false
	}
}

if sprite_index == spr_secretportal_spawnclose
	instance_destroy()

