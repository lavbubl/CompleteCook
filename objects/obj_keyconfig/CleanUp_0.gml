//resave the keybind struct, more info at the bottom of function set_globals
var keybindBuf = write_struct_to_buffer(global.keybinds)

buffer_save(keybindBuf, global.keybinds_filename)

buffer_delete(keybindBuf)
