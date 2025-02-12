var isPanic = global.panic.active;
	
if global.secret //move this to room start, im just lazy
{	
	if !secret_init
	{
		secret_mu = scr_sound(mu_secret, true)
	
		if !isPanic && audio_is_playing(mu)
		{
			var t_pos = wrap(audio_sound_get_track_position(mu), audio_sound_length(mu))
			audio_sound_set_track_position(secret_mu, t_pos)
		}
		
		pauseIDS(true);
	}
}
else
{
	if audio_is_playing(secret_mu)
	{
		audio_stop_sound(secret_mu);
		secret_mu = noone;
	}
	pauseIDS(false);
	
	if !isPanic
	{
		for (var i = 0; i < array_length(levelsongs); i++) 
		{
			var currentArr = levelsongs[i];
			var requiredRoom = currentArr[0];
			var requestedTrack = currentArr[1];
			var isContinuous = currentArr[2];
	
			var soundId = audio_sound_get_asset(mu);
	
			if soundId != requestedTrack && room == requiredRoom
			{
				var prevLength = noone;
				var prevPos = noone;
				if audio_is_playing(mu)
				{
					if isContinuous
					{
						prevPos = audio_sound_get_track_position(mu);
						prevLength = audio_sound_length(soundId);
				
						// emulate fading the old song out and fading the new song in
						prevmu = scr_sound(soundId, true);
						audio_sound_set_track_position(prevmu, prevPos);
						audio_sound_gain(prevmu, 0, 2000);
					}
					audio_stop_sound(mu);
				}
		
				mu = scr_sound(requestedTrack, true);
				audio_sound_gain(mu, prevLength ? 0 : 1, 0); // make it quiet so it can fade in
				if prevLength
				{
					audio_sound_set_track_position(mu, wrap(prevPos, prevLength));
					// emulate fading the old song out and fading the new song in
					audio_sound_gain(mu, 1, 2000);
				}
				
				break;
			}
		}

		if instance_exists(obj_pillar)
		{
			pillar_mu = scr_sound(mu_pillar, true)
			audio_sound_gain(pillar_mu, 0, 0)
		}
	}
}