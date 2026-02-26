if ds_list_find_index(global.ds_escapesaveroom, id) != -1 exit;

scr_sound(sfx_collectbig)
scr_sound_pitched(sfx_escapecollectbig)

ds_list_add(global.ds_escapesaveroom, id)
