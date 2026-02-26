if sprite_index != spr_titlepep_angry
{
	sprite_index = spr_titlepep_angry
	image_speed = 0.35
	alarm[0] = 80
}
else
{
	switch cur_selected
	{
		case 1:
			sprite_index = spr_titlepep_left
			break;
		case 2:
			sprite_index = spr_titlepep_middle
			break;
		case 3:
			sprite_index = spr_titlepep_right
			break;
	}
	cur_anim_num = cur_selected
}
