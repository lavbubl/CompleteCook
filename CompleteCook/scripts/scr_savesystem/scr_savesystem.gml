function gamesave_async_load()
{
	with (obj_savesystem)
	{
		if (state == 0)
		{
			loadbuff = buffer_create(1, buffer_grow, 1)
			buffer_async_group_begin("saves")
			buffer_load_async(loadbuff, get_savefile_ini(), 0, -1)
			loadid = buffer_async_group_end()
			state = 2
		}
	}
	exit;
}

function gamesave_async_save()
{
	with (obj_savesystem)
	{
		if (state == 0)
		{
			with (obj_achievementtracker)
			{
				achievement_save_variables(achievements_update)
				achievement_save_variables(achievements_notify)
			}
			showicon = 1
			icon_alpha = 3
			buffer_async_group_begin("saves")
			savebuff = buffer_create(1, buffer_grow, 1)
			ini_open_from_string(ini_str)
			var closestring = ini_close()
			buffer_write(savebuff, buffer_string, closestring)
			buffer_save_async(savebuff, get_savefile_ini(), 0, buffer_get_size(savebuff))
			saveid = buffer_async_group_end()
		}
	}
	exit;
}

