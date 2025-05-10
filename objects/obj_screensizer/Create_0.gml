gui_surf = noone

lb_sprs = [bg_letterbox, bg_letterbox2, bg_letterbox3]

depth = -999

ini_open("globalsave.ini")

var f = ini_read_real("options", "fullscreen", false)

lb_pos = ini_read_real("options", "letterbox_index", 0)

ini_close()

window_set_fullscreen(f)
application_surface_draw_enable(false)
window_enable_borderless_fullscreen(true)

gameframe_init()
gameframe_alpha_timer = 0

display_set_gui_size(960, 540)
