if (ds_list_find_index(global.ds_saveroom, id) == -1)
{
	with (instance_create(x, y, obj_enemycorpse))
	{
		sprite_index = spr_onewaydead
		image_xscale = other.image_xscale
	}
	fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/killingblow", x, y)
	ds_list_add(global.ds_saveroom, id)
}

instance_destroy(solidid)
