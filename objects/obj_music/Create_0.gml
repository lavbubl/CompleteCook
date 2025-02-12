//args room, sound asset, continous, 

levelsongs = 
[
	[level_1, mu_sundogfunk, false],
	[tower_1, mu_preheat, false],
	[Room6, mu_dropit, true]
]

pauseIDS = function(pause = true)
{
	var pauseSounds =
	[
		"mu",
		"prevmu",
		"panic_mu",
		"panic_pinch_mu"
	];
		
	for (var i = 0; i < array_length(pauseSounds); i++)
	{
		var variableAttempt = variable_instance_get(id, pauseSounds[i]);
			
		if variable_instance_exists(id, variableAttempt)
		{
			if pause
			{
				if audio_is_playing(variableAttempt)
					audio_pause_sound(variableAttempt);
			}
			else if !audio_is_playing(variableAttempt)
				audio_resume_sound(variableAttempt);		
		}
	}
}

mu = noone;
prevmu = noone;
panic_mu = noone;
panic_pinch_mu = noone
pillar_mu = noone
secret_mu = noone
panic_music_initiated = false
pinch_init = false
secret_init = false
