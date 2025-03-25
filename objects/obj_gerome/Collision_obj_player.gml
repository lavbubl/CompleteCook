if sprite_index != spr_gerome_collected
{
	reset_anim(spr_gerome_collected)
	scr_sound(sfx_geromecollect)
	global.combo.timer = 60
}
