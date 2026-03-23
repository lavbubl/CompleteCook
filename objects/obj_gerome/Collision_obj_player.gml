if sprite_index != spr_gerome_collected
{
	reset_anim(spr_gerome_collected)
	fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/geromecollect", x, y)
	create_effect(x, y, spr_taunteffect)
	global.combo.timer = 60
}
