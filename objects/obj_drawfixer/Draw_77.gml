draw_set_alpha(1)
gpu_set_blendmode(bm_normal)
draw_set_color(c_white)
draw_rectangle_color(-100, -100, 960 + 100, 540 + 100, 0, 0, 0, 0, false)
gpu_set_blendenable(false)
var app_scale = min(window_get_width() / 960, window_get_height() / 540)
draw_surface_ext(application_surface, (window_get_width() / 2) - ((surface_get_width(application_surface) * app_scale) / 2), (window_get_height() / 2) - ((surface_get_height(application_surface) * app_scale) / 2), app_scale, app_scale, 0, c_white, 1);
gpu_set_blendenable(true)
