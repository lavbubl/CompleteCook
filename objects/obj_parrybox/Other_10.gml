with obj_player
{
	image_speed = 0.35
	state = states.parry
	movespeed = -8
	flash = 10
	var ix = irandom_range(1, 3)
	reset_anim(asset_get_index($"spr_player_parry{ix}"))
	particle_create(x, y, particles.parry)
}

scr_sound_pitched(sfx_parry)
instance_destroy()
