if instance_exists(obj_pause)
{
	audio_resume_sound(mu_pause)
	audio_stop_sound(mu_options)
}

//resave the keybind struct, more info at the bottom of function set_globals
var keybindBuf = write_struct_to_buffer(global.keybinds)

buffer_save(keybindBuf, global.keybinds_filename)

buffer_delete(keybindBuf)
