function add_achievement_update(a_name, a_updaterate, a_createfunc, a_updatefunc)
{
	var q = 
	{
		name: a_name,
		update_rate: a_updaterate,
		frames: 0,
		update_func: -4,
		creation_code: -4,
		variables: ds_map_create(),
		unlocked: 0
	}

	q.update_func = method(q, a_updatefunc)
	if (create_func != -4)
	{
		q.creation_code = method(q, a_createfunc)
		q.creation_code()
	}
	ds_list_add(obj_achievementtracker.achievements_update, q)
	return q;
}

function add_achievement_notify(a_name, a_createfunc, a_func)
{
	var q = 
	{
		name: a_name,
		creation_code: -4,
		func: -4,
		unlocked: 0,
		variables: ds_map_create()
	}

	q.func = method(q, a_func)
	if (a_createfunc != -4)
	{
		q.creation_code = method(q, a_createfunc)
		q.creation_code()
	}
	ds_list_add(obj_achievementtracker.achievements_notify, q)
	return q;
}

function notification_push(notif_type, array_id_objindex_room)
{
	with (obj_achievementtracker)
		ds_queue_enqueue(notify_queue, [notif_type, array_id_objindex_room])
}

function achievement_add_variable(varname, varvalue, varsave = false)
{
	var q = 
	{
		init_value: varvalue,
		value: varvalue,
		save: varsave
	}

	ds_map_add(variables, varname, q)
	return q;
}

function achievement_get_variable(varname)
{
	return ds_map_find_value(variables, varname);
}

function achievement_unlock(achievement, tv_text, tv_spr)
{
	var b = achievement_get_struct(achievement)
	with (b)
	{
		unlocked = true
		tv_push_prompt(tv_text, tvprompt.normal, tv_spr, 2)
		quick_ini_write_real(get_savefile_ini(), "achievements", name, 1)
		gamesave_async_save()
	}
	with (obj_achievementviewer)
		event_perform(ev_other, ev_room_start)
}

function achievement_save_variables(argument0)
{
	for (var i = 0; i < ds_list_size(argument0); i++)
	{
		var b = ds_list_find_value(argument0, i)
		with (b)
		{
			var size = ds_map_size(variables)
			var key = ds_map_find_first(variables)
			for (i = 0; i < size; i++)
			{
				var q = ds_map_find_value(variables, key)
				if q.save
					quick_ini_write_real(get_savefile_ini(), "achievements_variables", key, q.value)
				key = ds_map_find_next(variables, key)
			}
		}
	}
}

function achievements_load(argument0)
{
	for (var i = 0; i < ds_list_size(argument0); i++)
	{
		var b = ds_list_find_value(argument0, i)
		with (b)
		{
			unlocked = ini_read_real("achievements", name, 0)
			size = ds_map_size(variables)
			key = ds_map_find_first(variables)
			for (i = 0; i < size; i++)
			{
				var q = ds_map_find_value(variables, key)
				if q.save
					q.value = ini_read_real("achievements_variables", key, q.init_value)
				key = ds_map_find_next(variables, key)
			}
		}
	}
}

function achievement_get_struct(argument0)
{
	var l = obj_achievementtracker.achievements_update
	var b = noone
	
	for(var i = 0; i < ds_list_size(l); i++)
	{
		var q = ds_list_find_value(l, i)
		if (q.name == argument0)
		{
			b = q
			break
		}
	}
	if (b == noone)
	{
		l = obj_achievementtracker.achievements_notify
		for(var i = 0; i < ds_list_size(l); i++)
		{
			b = ds_list_find_value(l, i)
			if (q.name == argument0)
			{
				b = q
				break
			}
		}
	}
	return b;
}
