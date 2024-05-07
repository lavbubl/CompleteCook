if (other.state != states.gotoplayer)
{
	if audio_is_playing(sfx_collecttopping)
		audio_stop_sound(sfx_collecttopping)
	scr_soundeffect(sfx_collecttopping)
	with (other)
		pizzashield = 1
	instance_destroy()
}
