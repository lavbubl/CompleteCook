#macro SCREEN_WIDTH 960
#macro SCREEN_HEIGHT 540

draw_flush()

tex_list = []
events_list = []
group_arr = ["Default", "texg_player", "texg_hud"]
bank_arr = ["Master", "Master.strings", "Music", "SFX"]

for (var i = 0; i < array_length(group_arr); i++)
{
	var _tex_array = texturegroup_get_textures(group_arr[i])
	for (var j = 0; j < array_length(_tex_array); j++)
	{
		array_push(tex_list, _tex_array[j])
	}
}

tex_max = array_length(tex_list)
events_max = 1

alarm[0] = 20
alarm[1] = 1 // Wait for obj_fmodhandler to init the system

lang_init()
