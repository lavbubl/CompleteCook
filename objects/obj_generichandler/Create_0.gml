global.col_obj_list = ds_list_create()
global.maingamepad = 0
for (var i = 0; i < gamepad_get_device_count(); i++) {
	if (gamepad_is_connected(i)) {
		global.maingamepad = i
	}
}

solids_to_add = [obj_solid, obj_pizzabox, obj_platform, obj_slope, obj_slopeplatform]
gui_surf = surface_create(screen_w, screen_h)

depth = -999

ini_open("globalsave.ini")
var f = ini_read_real("options", "fullscreen", false)
ini_close()

window_set_fullscreen(f)
