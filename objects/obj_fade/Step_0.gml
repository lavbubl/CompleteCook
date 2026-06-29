image_alpha = approach(image_alpha, fade ? fade + 0.2 : fade, 0.1)
if (image_alpha == 1.2)
{
	room_goto(target_room)
	fade = false
}
