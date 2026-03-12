collide_init()

vsp = -11
depth = -5
alarm[0] = 10

particle_create(x, y, particles.genericpoof)
fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/breakdance", x, y)

var _event_ref = fmod_studio_system_get_event("event:/sfx/misc/beatbox")
event_desc = fmod_studio_event_description_create_instance(_event_ref)
attributes = fmod_studio_event_instance_get_3d_attributes(event_desc)
attributes.position.x = x
attributes.position.y = y
fmod_studio_event_instance_start(event_desc)
fmod_studio_event_instance_release(event_desc)
fmod_studio_event_instance_set_3d_attributes(event_desc, attributes)
