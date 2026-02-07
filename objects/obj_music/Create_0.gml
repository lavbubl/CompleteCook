RoomMusic = function(_room, _song, _iscontinuous, _secretmusic = mu_secret, _loopstart = noone, _loopend = noone) constructor
{
	room_number = _room
	song = _song
	iscontinuous = _iscontinuous
	secretmusic = _secretmusic
	loopstart = _loopstart
	loopend = _loopend
}

levelsongs = 
[
	new RoomMusic(tower_1, mu_hub, false, mu_secret, 2.1, 153.68),
	new RoomMusic(entrance_1, mu_entrance, false, mu_entrance_secret, 51.18, 212.58),
	new RoomMusic(boss_test, mu_pepperman, false)
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
		
		if variableAttempt != noone
		{
			if pause
				audio_pause_sound(variableAttempt);
			else
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
secret_mu_to_play = noone
panic_music_initiated = false
pinch_init = false
lap2 = false
lap2_init = false
