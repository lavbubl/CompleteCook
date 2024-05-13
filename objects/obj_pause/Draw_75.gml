display_set_gui_size(winw, winh);
display_set_gui_maximise()
draw_set_color(c_black)
draw_rectangle(0, 0, winw, appy, false)
draw_rectangle(0, winh, winw, winh - appy - 2, false)
draw_rectangle(0, 0, appx, winh, false)
draw_rectangle(winw, 0, winw - appx, winh, false)
display_set_gui_maximise(-1, -1)
display_set_gui_size(960, 540)
