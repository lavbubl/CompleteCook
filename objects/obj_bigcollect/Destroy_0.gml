if ds_list_find_index(global.ds_saveroom, id) != -1 exit;

scr_sound(sfx_collectbig)
ds_list_add(global.ds_saveroom, id)
