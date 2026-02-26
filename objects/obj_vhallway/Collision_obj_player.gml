if !obj_fade.fade 
	scr_sound(sfx_door)
do_fade(t_room, t_door, fade_types.v_hallway)
with (other)
{
	dooryscale = sign(other.image_yscale)
	if state = states.climbwall
		wasclimbingwall = true
	break;
}
