ini_open("globalsave.ini")
global.unfocus_mute = ini_read_real("options", "unfocus_mute", true)
global.turnoffhud = ini_read_real("options", "turnoffhud", false)
ini_close()

gui_surf = noone
surface_resize(application_surface, screen_w, screen_h)

lb_sprs = [bg_letterbox, bg_letterbox2, bg_letterbox3]

depth = -999

ini_open("globalsave.ini")

var f = ini_read_real("options", "fullscreen", false)

lb_pos = ini_read_real("options", "letterbox_index", 0)

var res = [[480, 270], [960, 540], [1920, 1080]]
var chosen_res = ini_read_real("options", "res_number", 1)
var vsync = ini_read_real("options", "vsync", 1)

ini_close()

window_set_size(real(res[chosen_res][0]), real(res[chosen_res][1]))
window_center()
window_set_fullscreen(f)
display_reset(0, vsync);

application_surface_draw_enable(false)
window_enable_borderless_fullscreen(true)

gameframe_init()

display_set_gui_size(960, 540)
