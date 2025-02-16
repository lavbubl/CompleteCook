if (ds_list_find_index(global.ds_saveroom, id) == -1)
{
	particle_create(x, y, particles.bang)
	scr_sound_3d(sfx_bumpwall, x, y)
	tile_layer_delete_at(x, y)
    tile_layer_delete_at(x + 32, y)
    tile_layer_delete_at(x + 32, y + 32)
    tile_layer_delete_at(x, y + 32)
	
	ds_list_add(global.ds_saveroom, id)
}
