if (ds_list_find_index(global.ds_dead_enemies, id) == -1)
{
    ds_list_add(global.ds_dead_enemies, id)
	with (instance_create(x, y, obj_enemycorpse))
		sprite_index = other.sprs.dead

	global.combo.timer = 60
	global.combo.count++
	
	particle_create(x, y, particles.bang)
	repeat (3)
		particle_create(x, y, particles.yellowstar)
	scr_sound_3d(sfx_killenemy, x, y)
}

