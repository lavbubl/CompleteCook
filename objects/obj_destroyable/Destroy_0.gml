if (ds_list_find_index(global.ds_broken_destroyables, id) == noone)
{
	particle_create(x, y, particles.bang)
	scr_sound_3d(sfx_bumpwall, x, y)
}

ds_list_add(global.ds_broken_destroyables, id)
