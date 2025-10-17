if sprite_index != spr_gerome_collected
{
	reset_anim(spr_gerome_collected)
	scr_sound(sfx_geromecollect)
	create_effect(x, y, spr_taunteffect)
	global.combo.timer = 60
}
