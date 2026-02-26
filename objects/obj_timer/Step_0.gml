visible = global.option_timer && global.option_showhud

var s = 0.016666666666666666;

level_timer += s
if room != mainmenu && room != rank_room
	file_timer += s
else
	visible = false
