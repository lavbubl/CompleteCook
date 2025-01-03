#macro screen_w 960
#macro screen_h 540

window_set_size(screen_w, screen_h)
surface_resize(application_surface, screen_w, screen_h)
window_center()

tex_list = -4
draw_flush()
group_arr = ["Default", "texg_player"]
currenttexture = 0
tex_list = ds_list_create()
tex_pos = 0
for (var i = 0; i < array_length(group_arr); i++)
{
	var _tex_array = texturegroup_get_textures(group_arr[i])
	ds_list_add(tex_list, _tex_array)
}
tex_max = ds_list_size(tex_list)
alarm[0] = 20