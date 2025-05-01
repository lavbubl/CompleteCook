if ds_list_find_index(global.ds_saveroom, id) == -1
{
	particle_create(x, y, particles.genericpoof, image_xscale, image_yscale, spr_destroyable_bigcollect_dead)
	sleep(5)
	scr_sound_3d(sfx_collect, x, y)
	ds_list_add(global.ds_saveroom, id)
	var val = 100
	global.score += val
	global.combo.timer = 60
	with instance_create(x, y, obj_collect_number)
		num = val
}
