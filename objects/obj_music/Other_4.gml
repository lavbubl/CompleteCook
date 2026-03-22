var isPanic = global.panic.active;
	
if (global.secret && secret_mu_to_play != noone)
{
	var _secret_event_ref = fmod_studio_system_get_event(secret_mu_to_play)
	secret_mu = fmod_studio_event_description_create_instance(_secret_event_ref)
	fmod_studio_event_instance_start(secret_mu)
	
	if !isPanic && mu != noone
	{
		var t_pos = wrap(fmod_studio_event_description_get_length(_secret_event_ref), fmod_studio_event_instance_get_timeline_position(mu))
		fmod_studio_event_instance_set_timeline_position(secret_mu, t_pos)
	}
	
	pauseIDS(true);
}
else
{
	if secret_mu != noone
	{
		fmod_studio_event_instance_release(secret_mu)
		fmod_studio_event_instance_stop(secret_mu, FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT)
		secret_mu = noone;
		
		pauseIDS(false);
	}
	
	if !isPanic
	{
		for (var i = 0; i < array_length(levelsongs); i++) 
		{
			var currentSong = levelsongs[i];
			
			if (prev_mu_path != currentSong.song || mu == noone) && room == currentSong.room_number
			{
				if mu != noone
				{
					fmod_studio_event_instance_release(mu)
					fmod_studio_event_instance_stop(mu, FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT);
				}
				
				var _event_ref = fmod_studio_system_get_event(currentSong.song)
				mu = fmod_studio_event_description_create_instance(_event_ref)
				fmod_studio_event_instance_start(mu)
				
				prev_mu_path = currentSong.song
				
				secret_mu_to_play = currentSong.secretmusic
				
				break;
			}
		}

		if instance_exists(obj_pillar)
		{
			var _pillar_event_ref = fmod_studio_system_get_event("event:/music/pillar")
			pillar_mu = fmod_studio_event_description_create_instance(_pillar_event_ref)
			fmod_studio_event_instance_start(pillar_mu)
		}
	}
}
