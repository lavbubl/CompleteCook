depth = -50
image_speed = 0.35

sprs = {
	idle: spr_ratblock,
	bump: spr_ratblock_bump,
	dead: spr_ratblock_dead,
}

var _event_ref = fmod_studio_system_get_event("event:/sfx/misc/ratsniff")
event_desc = fmod_studio_event_description_create_instance(_event_ref)
attributes = fmod_studio_event_instance_get_3d_attributes(event_desc)
attributes.position.x = x
attributes.position.y = y
fmod_studio_event_instance_start(event_desc)
fmod_studio_event_instance_release(event_desc)
fmod_studio_event_instance_set_3d_attributes(event_desc, attributes)


if ds_list_find_index(global.ds_saveroom, id) != -1
	instance_destroy()
