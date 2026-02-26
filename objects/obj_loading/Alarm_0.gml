if (array_length(tex_list) > 0)
{
	var b = tex_list[0]
	for (var i = 0; i < array_length(b); i++)
	{
		if (!texture_is_ready(b[i]))
			texture_prefetch(b[i])
	}
	array_shift(tex_list)
	alarm[0] = 1
}
else if (currentsndgroup < array_length(snd_group_arr))
{
	var cur_group = snd_group_arr[currentsndgroup]
	if !audio_group_is_loaded(cur_group[0])
	{
		if !cur_group[1]
		{
			audio_group_load(cur_group[0])
			cur_group[1] = true
		}
	}
	else
		currentsndgroup++
	alarm[0] = 1
}
else
	room_goto(init_objs_room)
