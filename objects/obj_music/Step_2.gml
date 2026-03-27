var fmod_character = ds_map_create()
ds_map_set(fmod_character, characters.peppino, 0)
ds_map_set(fmod_character, characters.noise, 1)

fmod_studio_system_set_parameter_by_name("character", ds_map_find_value(fmod_character, obj_player.character), true)