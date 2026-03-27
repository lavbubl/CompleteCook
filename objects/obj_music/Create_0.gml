RoomMusic = function(_room, _song, _secretmusic = "event:/music/medievalsecret") constructor
{
	room_number = _room
	song = _song
	secretmusic = _secretmusic
}

levelsongs = 
[
	new RoomMusic(tower_1, "event:/music/hub"),
	new RoomMusic(entrance_1, "event:/music/entrance", "event:/music/entrancesecret"),
	new RoomMusic(dm_1, "event:/music/medieval"),
	new RoomMusic(boss_test, "event:/music/pepperman")
]

levelmusicstates = 
[
	[dm_1, 0], //set music_state to 0 at room dm_1
	[dm_2, 1], //set music_state to 1 at room dm_2
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
				fmod_studio_event_instance_set_paused(variableAttempt, true);
			else
				fmod_studio_event_instance_set_paused(variableAttempt, false);		
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
pillar_volume = 0
prev_mu_path = ""
