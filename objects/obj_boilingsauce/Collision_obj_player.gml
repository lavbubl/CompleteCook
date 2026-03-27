fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/genericfire", x, y)

with other
{
	movespeed = hsp
	state = states.fireass
	vsp = -20
	reset_anim(spr_player_fireass)
	if fmod_studio_event_instance_get_playback_state(fireass_snd) != FMOD_STUDIO_PLAYBACK_STATE.PLAYING
		fmod_studio_event_instance_start(fireass_snd)
}
