var total = 0

var p = tex_max - array_length(tex_list)
var t = (p / tex_max) * 50 // 50% of the loading

total += t

for (var i = 0; i < array_length(snd_group_arr); i++) {
	var cur_group = snd_group_arr[i][0]
	total += audio_group_load_progress(cur_group) / (array_length(snd_group_arr) * 2) //25% per audio group, 50% for both audio groups
}

//comes up to 100%

draw_sprite(spr_loadingscreen, 0, screen_w / 2, screen_h / 2)
var xx = (screen_w / 2) - sprite_get_xoffset(spr_loadingscreen)
var yy = (screen_h / 2) - sprite_get_yoffset(spr_loadingscreen)
var upscale = sprite_get_width(spr_loadingscreen) / 100
draw_sprite_part(spr_loadingscreen, 1, 0, 0, total * upscale, sprite_get_height(spr_loadingscreen), xx, yy)
