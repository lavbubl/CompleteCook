if (array_length(tex_list) > 0)
{
	texture_prefetch(tex_list[0])
	show_debug_message("Loaded texture " + string(tex_list[0]))
	array_shift(tex_list)
	alarm[0] = 1
}
else if (array_length(events_list) > 0)
{
	var _cur_event = events_list[0]
	var _load_state = fmod_studio_event_description_get_sample_loading_state(_cur_event)
	
	if _load_state == FMOD_STUDIO_LOADING_STATE.ERROR
		array_shift(events_list)
	else if _load_state == FMOD_STUDIO_LOADING_STATE.UNLOADED
		fmod_studio_event_description_load_sample_data(_cur_event)
	else if _load_state == FMOD_STUDIO_LOADING_STATE.LOADED
	{
		show_debug_message("Loaded event " + string(_cur_event))
		array_shift(events_list)
	}
	
	alarm[0] = 1
}
else
	room_goto(logo_credits)
