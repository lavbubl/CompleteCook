if ds_list_find_index(global.ds_secrets, id) != -1
	exit;

if sprite_index != spr_secretportal_enter
{
	reset_anim(spr_secretportal_enter)
	scr_sound_3d(sfx_secretenter, x, y)
}

do_hold_player(true)
