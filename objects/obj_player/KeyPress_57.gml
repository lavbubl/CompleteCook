if keyboard_check(vk_shift)
{
	var bank_arr = ["Master", "Master.strings", "Music", "SFX"]
	for (var i = 0; i < array_length(bank_arr); i++) //get the banks metadata
	{
		var _name = bank_arr[i]
		var _fn = fmod_path_bundle(string_concat(_name, ".bank"))
		bank_arr[i] = fmod_studio_system_load_bank_file(_fn, FMOD_STUDIO_LOAD_BANK.NORMAL)
		fmod_studio_bank_unload(bank_arr[i])
	}
	
	fmod_studio_system_unload_all()

	game_restart()
}
