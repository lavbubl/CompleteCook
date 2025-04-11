#macro screen_w 960
#macro screen_h 540

window_set_size(screen_w, screen_h)
surface_resize(application_surface, screen_w, screen_h)
window_center()
draw_flush()

tex_list = []
group_arr = ["Default", "texg_player", "texg_hud"]
snd_group_arr = [[ag_sfx, false], [ag_music, false]]
currentsndgroup = 0

for (var i = 0; i < array_length(group_arr); i++)
{
	var _tex_array = texturegroup_get_textures(group_arr[i])
	array_push(tex_list, _tex_array)
}

tex_max = array_length(tex_list)
alarm[0] = 20
