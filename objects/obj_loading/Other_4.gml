for (var i = 0; i < array_length(bank_arr); i++) //get the banks metadata
{
	var _name = bank_arr[i]
	var _fn = fmod_path_bundle(string_concat(_name, ".bank"))
	bank_arr[i] = []
	bank_arr[i][0] = fmod_studio_system_load_bank_file(_fn, FMOD_STUDIO_LOAD_BANK.NORMAL)
	bank_arr[i][1] = false
	show_debug_message(_fn)
	show_debug_message(bank_arr[i][0])
}
