if (place_meeting(x, y, obj_player) && image_speed == 0)
{
	scr_soundeffect(sfx_mine)
	image_speed = 0.35
}
if (floor(image_index) == (image_number - 1))
	instance_destroy()
