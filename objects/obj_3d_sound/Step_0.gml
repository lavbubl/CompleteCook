audio_listener_position(obj_camera.campos.x + (screen_w / 2), obj_camera.campos.y + (screen_h / 2), 0)

for (var i = 0; i < ds_list_size(emitters); i++) {
	var e_id = ds_list_find_value(emitters, i)
	
	if (!audio_emitter_exists(e_id[0]))
	{
		ds_list_delete(emitters, i)
		continue;
	}
	
	var obj_to_follow = e_id[1]
	if (obj_to_follow != -1)
		audio_emitter_position(e_id[0], obj_to_follow.x, obj_to_follow.y, 0)
}
