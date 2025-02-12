if global.panic.active
	exit;

for (var i = 0; i < array_length(levelsongs); i++) 
{
	var already_playing = false
	
	if mu != -1
	{
		if room == levelsongs[i][0] && levelsongs[i][1] == audio_sound_get_asset(mu) 
			already_playing = true
	}
	
	if room == levelsongs[i][0] && !already_playing 
	{
		if levelsongs[i][2] == true
		{
			var prevpos = 0
			var prevsoundlength = 0
			if mu != -1
			{
				prevpos = audio_sound_get_track_position(mu)
				prevsoundlength = audio_sound_length(audio_sound_get_asset(mu))
				prevmu = scr_sound(audio_sound_get_asset(mu), true)
				audio_sound_set_track_position(prevmu, prevpos)
				audio_sound_gain(prevmu, 0, 2000)
			}
			audio_stop_sound(mu)
			mu = scr_sound(levelsongs[i][1], true)
			if prevsoundlength > 0
				audio_sound_set_track_position(mu, wrap(prevpos, prevsoundlength))
			audio_sound_gain(mu, 0, 0)
			audio_sound_gain(mu, 1, 2000)
		}
		else
		{
			audio_stop_sound(mu)
			mu = scr_sound(levelsongs[i][1], true)
		}
	}
}

if (instance_exists(obj_pillar))
{
	pillar_mu = scr_sound(mu_pillar, 1)
	audio_sound_gain(pillar_mu, 0, 0)
}
