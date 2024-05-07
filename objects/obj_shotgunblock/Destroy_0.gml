scr_destroy_tiles(32, "Tiles_1")
if (ds_list_find_index(global.saveroom, id) == -1)
{
	repeat (7)
		create_debris((x + 32), (y + 32), spr_bigdebris)
	scr_soundeffect(sfx_breakblock1, sfx_breakblock2)
	ds_list_add(global.saveroom, id)
}
