if (!(ds_exists(tex_list, 2)))
	exit;
var p = (tex_max - ds_list_size(tex_list))
var t = ((p / tex_max) * 100)

draw_healthbar(0, screen_h - 16, screen_w, screen_h, t, c_black, c_white, c_white, 0, 0, 0)
draw_set_color(c_white)
draw_set_font(-4)
draw_set_halign(fa_left)
draw_set_valign(fa_bottom)

if (!ds_list_empty(tex_list))
{
	var b = ds_list_find_value(tex_list, 0)
	draw_text(16, 508, string_concat("Loading ", group_arr[currenttexture]))
}

draw_sprite(spr_title, 0, screen_w / 2, screen_h / 2)
