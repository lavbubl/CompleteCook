enum windowmode
{
	windowed,
	fullscreen,
	borderless
}

gameframe_init()

gui_surf = noone

lb_sprs = [bg_letterbox, bg_letterbox2, bg_letterbox3]

depth = -999

ini_open("globalsave.ini")

lb_pos = ini_read_real("options", "letterbox_index", 0)

global.option_windowmode = ini_read_real("options", "windowmode", windowmode.windowed)
global.option_res_strings = ["480X270", "960X540", "1024X576", "1280X720", "1600X900", "1920X1080"]
global.option_chosen_res = ini_read_real("options", "chosen_res", 1)
global.option_texturefilter = ini_read_real("options", "texturefilter", 1)

ini_close()

if global.option_windowmode == windowmode.fullscreen
	gameframe_set_fullscreen(1)
else if global.option_windowmode == windowmode.borderless
	gameframe_set_fullscreen(2)
else
{
	var _split = string_split(global.option_res_strings[global.option_chosen_res], "X")
	window_set_size(real(_split[0]), real(_split[1]))
	window_center()
}

application_surface_draw_enable(false)

surface_resize(application_surface, SCREEN_WIDTH, SCREEN_HEIGHT)
display_set_gui_size(SCREEN_WIDTH, SCREEN_HEIGHT)
