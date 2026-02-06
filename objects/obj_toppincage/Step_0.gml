if help_ix == 0
	snd = scr_sound_3d(sfx_toppinhelp, x, y)

if ds_list_find_index(global.ds_saveroom, id) != -1
	instance_destroy()
