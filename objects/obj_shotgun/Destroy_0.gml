if ds_list_find_index(global.ds_saveroom, id) == -1
{
	repeat 4
		create_debris(x, y, spr_shotgunpickup_debris)
	create_effect(x, y, spr_shotgunpickup_grabeffect)
	ds_list_add(global.ds_saveroom, id)
}
