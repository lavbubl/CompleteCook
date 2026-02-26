for (var i = 0; i < array_length(emitters); i++) {
	var e_id = emitters[i]
	
	if (!audio_emitter_exists(e_id[0]))
	{
		array_delete(emitters, i, 1)
		continue;
	}
	
	var follow_obj = e_id[1]
	if (follow_obj != noone && audio_emitter_exists(e_id[0]))
		audio_emitter_position(e_id[0], follow_obj.x, follow_obj.y, 0)
}
