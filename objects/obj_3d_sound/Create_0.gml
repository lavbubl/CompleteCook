global.sound_3d = {
	falloff_ref_dist: SCREEN_WIDTH / 2,
	falloff_max_dist: SCREEN_WIDTH * 1.5,
	falloff_factor: 1
}

audio_falloff_set_model(audio_falloff_linear_distance_clamped);
audio_listener_orientation(0, 0, 1, 0, -1, 0)
emitters = []

with obj_player
	myemitter = emitter_create_quick(x, y, self)
