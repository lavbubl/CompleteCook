var xh = lerp(bbox_left, bbox_right, 0.5)

with other
{
	if i_frames <= 0
	{
		sprite_index = xh >= 0 ? spr_player_hurt : spr_player_piledriverjump
		do_hurt()
	}
}
