var xh = lerp(bbox_left, bbox_right, 0.5)

var inactive = false

if (follow_obj != -4)
	inactive = follow_obj.state == e_states.stun || follow_obj.state == e_states.scared

with other
{
	if (i_frames <= 0 && state != states.parry && !inactive)
	{
		sprite_index = xh >= 0 ? spr_player_hurt : spr_player_piledriverjump
		do_hurt()
	}
}
