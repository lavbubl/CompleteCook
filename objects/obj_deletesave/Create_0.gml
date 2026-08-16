quit = false
quit_timer = 0
depth = -100
image_speed = 0.1

fmod_studio_event_instance_oneshot("event:/sfx/misc/menu/oink")

var _bomb_event_ref = fmod_studio_system_get_event("event:/sfx/misc/menu/fuse")
bomb_snd = fmod_studio_event_description_create_instance(_bomb_event_ref)
