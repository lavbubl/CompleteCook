function scr_deactivate_escape()
{
	with (obj_baddie)
	{
		hitboxcreate = 0
		boundbox = 0
		event_perform(ev_other, ev_room_start)
	}
	with (obj_hiddenobject)
	{
		if (!ds_list_empty(deactivatedlist))
		{
			for (var i = 0; i < ds_list_size(deactivatedlist); i++)
			{
				var _id = ds_list_find_value(deactivatedlist, i)
				if (object_get_parent(_id) == 407)
					_id.boundbox = 0
				instance_deactivate_object(_id)
			}
		}
	}
	with (obj_arenaspawn)
	{
		if (state == states.spawnenemy or state == states.arena)
		{
			if (!ds_list_empty(baddielist))
			{
				for (i = 0; i < ds_list_size(baddielist); i++)
				{
					var b = ds_list_find_value(baddielist, i)
					if (b[0] != wave && instance_exists(b[1]))
					{
						b[1].boundbox = 0
						instance_deactivate_object(b[1])
					}
				}
			}
		}
		else if (!ds_list_empty(baddielist))
		{
			for (i = 0; i < ds_list_size(baddielist); i++)
			{
				b = array_get(ds_list_find_value(baddielist, i), 1)
				if instance_exists(b)
				{
					b.boundbox = 0
					instance_deactivate_object(b)
				}
			}
		}
	}
	exit;
}

