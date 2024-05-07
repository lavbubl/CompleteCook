if (!active)
{
	global.railspeed = 0
	with (obj_railparent)
		alarm[0] = 1
	active = 1
	ds_list_add(global.saveroom, id)
}
