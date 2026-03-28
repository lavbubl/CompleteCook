with obj_player
{
	image_speed = 0.35
	state = states.parry
	movespeed = -8
	flash = 10
	var ix = irandom_range(1, 3)
	reset_anim(variable_instance_get(self, $"spr_player_parry{ix}"))
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
		fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/punch", x, y)
		particle_create(x, y, particles.parry)
	}
}

fmod_studio_event_instance_oneshot_3d("event:/sfx/player/parry", x, y)
instance_destroy()
