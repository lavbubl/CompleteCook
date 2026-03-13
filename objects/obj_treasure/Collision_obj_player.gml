if !collected
{
	with other
	{
		state = states.actor
		hsp = 0
		vsp = 0
		fmod_studio_event_instance_oneshot_3d("event:/music/treasurefound", x, y)
		other.x = x
		other.y = y
	}
	alarm[0] = 150
	
	if obj_music.mu != noone
		audio_sound_gain(obj_music.mu, 0.5, 250)
	
	if obj_music.panic_mu != noone
		audio_sound_gain(obj_music.panic_mu, 0.5, 250)
	
	collected = true
}
