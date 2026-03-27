maxspeed = 8
image_speed = 0.35
depth = -5

savedcx = camera_get_view_x(view_camera[0])
savedcy = camera_get_view_y(view_camera[0])

savedx = x
savedy = y

x = obj_player.x
y = obj_player.y

alarm[1] = 10

image_alpha = 0
xscale = 1

var _event_ref = fmod_studio_system_get_event("event:/sfx/misc/pizzafacemove")
event_desc = fmod_studio_event_description_create_instance(_event_ref)
attributes = fmod_studio_event_instance_get_3d_attributes(event_desc)
attributes.position.x = x
attributes.position.y = y
fmod_studio_event_instance_start(event_desc)
fmod_studio_event_instance_release(event_desc)
fmod_studio_event_instance_set_3d_attributes(event_desc, attributes)
