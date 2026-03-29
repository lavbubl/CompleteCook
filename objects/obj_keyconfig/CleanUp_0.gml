//resave the keybind struct, more info at the bottom of function set_globals
var keybindBuf = buffer_create(1, buffer_grow, 1);
buffer_write(keybindBuf, buffer_text, json_stringify(global.keybinds));

buffer_save(keybindBuf, global.keybinds_filename)

buffer_delete(keybindBuf)

input_handler.Cleanup();