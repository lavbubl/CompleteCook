var isPanic = global.panic.active;
	
if (global.secret && secret_mu_to_play != noone)
{	
	secret_mu = scr_sound(secret_mu_to_play, true)
	
	if !isPanic && mu != noone
	{
		var t_pos = wrap(audio_sound_length(secret_mu_to_play), audio_sound_get_track_position(mu))
		audio_sound_set_track_position(secret_mu, t_pos)
	}
	
	pauseIDS(true);
}
else
{
	if secret_mu != noone
	{
		audio_stop_sound(secret_mu);
		secret_mu = noone;
		
		//emulate the slight pause fmod does in pizza tower
		alarm[1] = 15
	}
	
	if !isPanic
	{
		for (var i = 0; i < array_length(levelsongs); i++) 
		{
			var currentSong = levelsongs[i]; 
			
			var soundId = noone
			if mu != noone
				soundId = audio_sound_get_asset(mu);
	
			if (soundId != currentSong.song && room == currentSong.room_number)
			{
				var prevLength = 0;
				var prevPos = noone;
				if mu != noone
				{
					if currentSong.iscontinuous
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
				
				mu = scr_sound(currentSong.song, true);
				
				audio_sound_gain(mu, prevLength ? 0 : 1, 0); // make it quiet so it can fade in
				if prevLength
				{
					audio_sound_set_track_position(mu, wrap(prevLength, prevPos));
					// emulate fading the old song out and fading the new song in
					audio_sound_gain(mu, 1, 2000);
				}
				
				if currentSong.loopstart != noone
					audio_sound_loop_start(mu, currentSong.loopstart)
				
				if currentSong.loopend != noone
					audio_sound_loop_end(mu, currentSong.loopend)
				
				secret_mu_to_play = currentSong.secretmusic
				
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
//now the definitions are kinda fucky but now it works with constructors