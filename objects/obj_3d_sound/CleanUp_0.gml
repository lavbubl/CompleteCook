audio_stop_all()
for (var i = 0; i < array_length(emitters); i++) {
	audio_emitter_free(emitters[i][0])
}
