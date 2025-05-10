if menu_dark
	exit;

var do_switch = false
if cur_anim_num != cur_selected
	do_switch = true

switch (sprite_index)
{
	//start
	case spr_titlepep_forward:
		reset_anim(spr_titlepep_forwardtoleft)
		break;
	//transitions
	case spr_titlepep_forwardtoleft:
	case spr_titlepep_middletoleft:
		sprite_index = spr_titlepep_left
		cur_anim_num = 1
		break;
	case spr_titlepep_lefttomiddle:
	case spr_titlepep_righttomiddle:
		sprite_index = spr_titlepep_middle
		cur_anim_num = 2
		break;
	case spr_titlepep_middletoright:
		sprite_index = spr_titlepep_right
		cur_anim_num = 3
		break;
	//still frames
	case spr_titlepep_left:
		if do_switch
			reset_anim(spr_titlepep_lefttomiddle)
		break;
	case spr_titlepep_middle:
		if do_switch
			reset_anim(cur_selected == 1 ? spr_titlepep_middletoleft : spr_titlepep_middletoright)
		break;
	case spr_titlepep_right:
		if do_switch
			reset_anim(spr_titlepep_righttomiddle)
		break;
}
