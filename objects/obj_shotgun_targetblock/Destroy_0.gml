if ds_list_find_index(global.ds_saveroom, id) == -1
{
	var i = 0
	repeat 3
	{
	    with (create_debris(x + 32, y + 32, spr_shotgun_targetblockdebris))
	        image_index = i
		i++
	}
	fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/breakblock", x, y)
    ds_list_add(global.ds_saveroom, id)
}
