if !obj_fade.fade 
	fmod_studio_event_instance_oneshot("event:/sfx/misc/transition")
do_fade(t_room, t_door, fade_types.v_hallway)
with (other)
{
	dooryscale = sign(other.image_yscale)
	if state = states.climbwall
		wasclimbingwall = true
	break;
}
