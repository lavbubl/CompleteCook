if do_particles
{
	with instance_create(x, y, obj_enemycorpse)
		sprite_index = other.sprs.dead

	global.combo.timer = 60
	global.combo.count++
	
	obj_player.supertauntcount++
	
	obj_levelcontroller.killed_enemy = true
	
	particle_create(x, y, particles.bang)
	particle_create(x, y, particles.genericpoof)
	repeat 3
		particle_create(x, y, particles.yellowstar)
	scr_sound_3d(sfx_killenemy, x, y)
	shake_camera(3, 3 / room_speed)
	
	ds_list_add(!escape ? global.ds_dead_enemies : global.ds_escapesaveroom, id)
}
