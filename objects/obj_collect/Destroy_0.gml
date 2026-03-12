if ds_list_find_index(global.ds_saveroom, id) != -1 exit;

fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/collect", x, y)
ds_list_add(global.ds_saveroom, id)
