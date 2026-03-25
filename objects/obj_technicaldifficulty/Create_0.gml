fmod_studio_event_instance_oneshot("event:/sfx/misc/techdiff")
fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/slam", obj_player.x, obj_player.y)
image_speed = 0.35
sprite_index = spr_techdiff_static
depth = -999
techdiff_spr = obj_player.character == characters.noise ? spr_techdiffN : spr_techdiffP
state = 0
t_ix = 0
