if (ds_list_find_index(global.ds_saveroom, id) == -1)
{
	with create_debris(x, y - 32, spr_toppincage_debris)
	    image_index = 0
	with create_debris(x, y + 32, spr_toppincage_debris)
	    image_index = 1
	with create_debris(x - 10, y, spr_toppincage_debris)
	    image_index = 2
	with create_debris(x, y, spr_toppincage_debris)
	    image_index = 3
	with create_debris(x + 10, y, spr_toppincage_debris)
	    image_index = 4
	//scr_sound(sfx_breakblock)
	
    ds_list_add(global.ds_saveroom, id)
}
