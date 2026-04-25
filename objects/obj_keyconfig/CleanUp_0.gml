//resave the keybind struct, more info at the bottom of function set_globals
var keybindBuf = write_struct_to_buffer(global.keybinds)

buffer_save(keybindBuf, global.keybinds_filename)

buffer_delete(keybindBuf)

with obj_inputhandler
	event_user(0)
	
scr_sound(choose(sfx_ui_accept1, sfx_ui_accept2, sfx_ui_accept3))

do_tip("{u}Controls saved!")
