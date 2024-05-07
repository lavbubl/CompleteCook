image_speed = 0.5
rat = 1
if point_in_camera(x, y, view_camera[0])
{
	if audio_is_playing(sfx_explosion)
		audio_stop_sound(sfx_explosion)
	scr_soundeffect(sfx_explosion)
}
