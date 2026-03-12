if ds_list_find_index(global.ds_escapesaveroom, id) != -1 exit;

fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/collectbig", x, y)
fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/escapecollectbig", x, y)

ds_list_add(global.ds_escapesaveroom, id)
