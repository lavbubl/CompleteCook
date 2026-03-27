if ds_list_find_index(global.ds_escapesaveroom, id) != -1 exit;

var s = fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/escapecollect", x, y)

ds_list_add(global.ds_escapesaveroom, id)
