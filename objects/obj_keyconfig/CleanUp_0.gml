/// @description save the new struct to the json file

var _file = file_text_open_write(global.keybinds_filename)
var _bindjson = json_stringify(global.bindslist)
file_text_write_string(_file, _bindjson)
file_text_close(_file)

scr_sound(choose(sfx_ui_accept1, sfx_ui_accept2, sfx_ui_accept3))

do_tip("{u}Controls saved!")
