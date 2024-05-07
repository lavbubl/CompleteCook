var _destroyed = 0
if (ds_list_find_index(global.baddieroom, id) != -1)
{
	_destroyed = 1
	instance_destroy()
}
if (escape == true && (!_destroyed))
{
	var b = 0
	with (obj_escapespawn)
	{
		if (baddieID == other.id && state != 0)
			b = 1
	}
	if (!b)
	{
		instance_deactivate_object(id)
		with (instance_create(x, y, obj_escapespawn))
			baddieID = other.id
	}
}
if elite
{
	hp += 1
	elitehp = hp
}
