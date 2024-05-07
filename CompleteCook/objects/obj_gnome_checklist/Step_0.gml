if start
{
	yy -= start_spd
	if (yy <= 326)
	{
		yy = 326
		start = 0
	}
}
else if finish
{
	yy += finish_spd
	if (yy >= 755)
		instance_destroy()
}
if (global.panic == true)
	finish = 1
var hide = 0
with (obj_player)
{
	if (x > (room_width - 215) && y > (room_height - 215))
		hide = 1
}
if (camera_get_view_x(view_camera[0]) >= (room_width - camera_get_view_width(view_camera[0])))
	hide = 1
if hide
{
	if (image_alpha > 0.5)
		image_alpha -= 0.1
	else
		image_alpha = 0.5
}
else if (image_alpha < 1)
	image_alpha += 0.1
else
	image_alpha = 1
if (room == timesuproom or (!global.showgnomelist))
	visible = false
else
	visible = true
