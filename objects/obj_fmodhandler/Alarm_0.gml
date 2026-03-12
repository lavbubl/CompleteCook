
master_bus = fmod_studio_system_get_bus("bus:/")
show_debug_message(master_bus)
music_group = fmod_studio_system_get_bus("bus:/Music")
show_debug_message(music_group)
sfx_group = fmod_studio_system_get_bus("bus:/SFX")
show_debug_message(sfx_group)

fmod_studio_bus_set_volume(obj_fmodhandler.music_group, global.option_music_volume)
fmod_studio_bus_set_volume(obj_fmodhandler.sfx_group, global.option_sfx_volume)
//gay ass busses arent being retrieved so i gotta hack it like this fml
