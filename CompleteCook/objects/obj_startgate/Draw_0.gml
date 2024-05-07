draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
draw_self()
if drawing
{
	draw_text(x, (y - 150), highscore)
	draw_text(x, (y - 200), (secret_count + " OF 6 SECRET"))
	draw_sprite((toppin[0] ? spr_toppinshroom : spr_toppinshroom_pause), -1, (x - 75), (y - 100))
	draw_sprite((toppin[1] ? spr_toppincheese : spr_toppincheese_pause), -1, (x - 35), (y - 100))
	draw_sprite((toppin[2] ? spr_toppintomato : spr_toppintomato_pause), -1, x, (y - 100))
	draw_sprite((toppin[3] ? spr_toppinsausage : spr_toppinsausage_pause), -1, (x + 35), (y - 100))
	draw_sprite((toppin[4] ? spr_toppinpineapple : spr_toppinpineapple_pause), -1, (x + 75), (y - 100))
}
