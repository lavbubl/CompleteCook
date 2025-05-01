if alph > 0
{
	draw_set_font(global.creditsfont)
	draw_set_alpha(alph)
	draw_set_align(fa_center, fa_bottom, c_white)
	
	var name = clothes_arr[clothes_selected].name
	var desc = clothes_arr[clothes_selected].description
	
	draw_text(screen_w / 2, screen_h - 50 - string_height("M"), name)
	draw_text(screen_w / 2, screen_h - 50, desc)
	
	draw_set_alpha(1)
}
