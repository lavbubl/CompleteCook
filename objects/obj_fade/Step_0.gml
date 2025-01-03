image_alpha = approach(image_alpha, fade, 0.1)
if (image_alpha == 1)
{
	room_goto(target_room)
	fade = false
}
