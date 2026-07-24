show_debug_message("Loading banks")

for (var i = 0; i < array_length(bank_arr); i++) // Get the banks metadata
{
	var _name = bank_arr[i]
	var _fn = fmod_path_bundle(string_concat("Banks\\", _name, ".bank"))
	bank_arr[i] = [fmod_studio_system_load_bank_file(_fn, FMOD_STUDIO_LOAD_BANK.NORMAL), false]
	
	show_debug_message("Loaded bank " + _name + ".bank")
	
	var _events_list = fmod_studio_bank_get_event_description_list(bank_arr[i][0])
	
	if is_array(_events_list)
	{
		for (var j = 0; j < array_length(_events_list); j++) {
			array_push(events_list, _events_list[j])
		}
	}
}

events_max = array_length(events_list)

show_debug_message("Initializing buses")

with obj_fmodhandler // Initialize audio busses
{
	master_bus = fmod_studio_system_get_bus("bus:/")
	show_debug_message("Initialized Master bus")
	music_group = fmod_studio_system_get_bus("bus:/Music")
	show_debug_message("Initialized Music bus")
	sfx_group = fmod_studio_system_get_bus("bus:/SFX")
	show_debug_message("Initialized SFX bus")
	
	fmod_studio_bus_set_volume(obj_fmodhandler.music_group, global.option_music_volume)
	fmod_studio_bus_set_volume(obj_fmodhandler.sfx_group, global.option_sfx_volume)
}
