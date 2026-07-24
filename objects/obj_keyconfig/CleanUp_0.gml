/// @description save the new struct to the json file

var _file = file_text_open_write(global.keybinds_filename)
var _bindjson = json_stringify(global.bindslist)
file_text_write_string(_file, _bindjson)
file_text_close(_file)

fmod_studio_event_instance_oneshot("event:/sfx/misc/ui_back")

do_tip("{u}Controls saved!")
