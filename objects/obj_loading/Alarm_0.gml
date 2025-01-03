if (!(ds_exists(tex_list, 2)))
	exit;
if (!ds_list_empty(tex_list))
{
	var b = ds_list_find_value(tex_list, 0)
	for (var i = 0; i < array_length(b); i++)
	{
		if (!texture_is_ready(b[i]))
			texture_prefetch(b[i])
	}
	ds_list_delete(tex_list, 0)
	currenttexture++
}
else
{
	ds_list_destroy(tex_list)
	room_goto(init_objs)
}
alarm[0] = 1