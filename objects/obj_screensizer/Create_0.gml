gui_surf = noone
surface_resize(application_surface, screen_w, screen_h)

lb_sprs = [bg_letterbox, bg_letterbox2, bg_letterbox3]

depth = -999

ini_open("globalsave.ini")

var f = ini_read_real("options", "fullscreen", false)

lb_pos = ini_read_real("options", "letterbox_index", 0)

global.res_strings = ["480X270", "960X540", "1024X576", "1280X720", "1600X900", "1920X1080"]
global.chosen_res = ini_read_real("options", "chosen_res", 1)

var vsync = ini_read_real("options", "vsync", 1)

ini_close()

var _split = string_split(global.res_strings[global.chosen_res], "X")

window_set_size(real(_split[0]), real(_split[1]))
window_center()

window_set_fullscreen(f)

display_reset(0, vsync)

application_surface_draw_enable(false)
window_enable_borderless_fullscreen(true)

gameframe_init()

display_set_gui_size(960, 540)
