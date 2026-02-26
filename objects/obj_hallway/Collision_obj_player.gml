if !obj_fade.fade 
	scr_sound(sfx_door)
do_fade(t_room, t_door, fade_types.hallway)
with (other)
	doorxscale = sign(other.image_xscale)
