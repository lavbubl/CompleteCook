if (array_length(tex_list) > 0)
{
	var b = tex_list[0]
	for (var i = 0; i < array_length(b); i++)
	{
		if (!texture_is_ready(b[i]))
			texture_prefetch(b[i])
	}
	array_shift(tex_list)
	if array_length(tex_list) > 1
		currenttexture++
	alarm[0] = 1
}
else
	room_goto(init_objs_room)
