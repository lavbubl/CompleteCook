if !obj_fade.fade 
	fmod_studio_event_instance_oneshot("event:/sfx/misc/transition")
do_fade(t_room, t_door, fade_types.hallway)
with (other)
	doorxscale = sign(other.image_xscale)
