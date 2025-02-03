global.col_obj_list = ds_list_create()
global.maingamepad = 0
global.saveroom = ds_list_create()
ds_list_add(global.saveroom, -4) // idk why but this fixes one problem.
gamepadarr = []
var p = 0
for (var i = 0; i < gamepad_get_device_count(); i++) {
	if (gamepad_is_connected(i)) {
		array_push(gamepadarr, i)
	}
}
show_debug_message(gamepadarr)
if (array_length(gamepadarr) > 0)
	global.maingamepad = gamepadarr[p]

solids_to_add = [obj_solid, obj_pizzabox, obj_platform, obj_slope, obj_slopeplatform]
gui_surf = surface_create(screen_w, screen_h)

depth = -999

ini_open("globalsave.ini")
var f = ini_read_real("options", "fullscreen", false)
ini_close()

window_set_fullscreen(f)
