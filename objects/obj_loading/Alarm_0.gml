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
else if (currentsndgroup < array_length(bank_arr))
{
	var _cur_bank = bank_arr[currentsndgroup][0]
	if fmod_studio_bank_get_sample_loading_state(_cur_bank) == FMOD_STUDIO_LOADING_STATE.UNLOADED
	{
		if currentsndgroup != 1 //if not Master.strings.bank
			fmod_studio_bank_load_sample_data(_cur_bank)
		else
			currentsndgroup++
	}
	else if fmod_studio_bank_get_loading_state(_cur_bank) == FMOD_STUDIO_LOADING_STATE.LOADED
	{
		currentsndgroup++
		show_debug_message("loaded bank" + string(currentsndgroup))
	}
	alarm[0] = 1
}
else
	room_goto(logo_credits)
