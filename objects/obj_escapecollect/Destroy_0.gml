if ds_list_find_index(global.ds_escapesaveroom, id) != -1 exit;

var s = scr_sound_multiple(sfx_escapecollect)
audio_sound_pitch(s, random_range(0.9, 1.1)) //funny hack

ds_list_add(global.ds_escapesaveroom, id)
