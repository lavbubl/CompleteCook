if (ds_list_find_index(global.ds_saveroom, id) == -1)
{
	particle_create(x, y, particles.bang)
	sleep(5)
    scr_sound_3d(choose(sfx_breakblock1, sfx_breakblock2), x, y)
	tile_layer_delete_at(x, y)
	ds_list_add(global.ds_saveroom, id)
}
