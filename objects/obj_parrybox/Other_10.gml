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

with par_enemy
{
	if enemy_can_die() && distance_to_object(other) <= 84
	{
		sprite_index = sprs.stun
		alarm[0] = 5
		do_enemygibs()
		shake_camera(3, 3 / room_speed)
		scr_sound_3d_pitched(sfx_punch, x, y)
		particle_create(x, y, particles.parry)
	}
}

scr_sound_3d_pitched(sfx_parry, x, y)
instance_destroy()
