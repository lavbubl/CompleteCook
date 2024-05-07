var _destroyed = 0
if (ds_list_find_index(global.baddieroom, id) != -1)
{
	_destroyed = 1
	instance_destroy()
}
if (escape == true && (!_destroyed))
{
	instance_deactivate_object(id)
	with (instance_create(x, y, obj_escapespawn))
		baddieID = other.id
}
