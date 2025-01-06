if (ds_list_find_index(global.ds_dead_enemies, id) == -1)
{
	with (instance_create(x, y, obj_enemycorpse))
		sprite_index = other.sprs.dead

	global.combo.timer = 60
	global.combo.count++
}

ds_list_add(global.ds_dead_enemies, id)
