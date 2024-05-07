draw_self()
if place_meeting(x, y, obj_player)
{
	draw_set_color(c_white)
	var txt = concat(currentscore)
	draw_text(x, (y - 48), concat(currentscore))
}
