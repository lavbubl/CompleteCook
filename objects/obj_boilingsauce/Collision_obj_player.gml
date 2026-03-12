if !audio_is_playing(v_peppinoscream)
{
	scr_sound_pitched(v_peppinoscream)
	scr_sound(sfx_fireass)
}
fmod_studio_event_instance_oneshot("event:/sfx/misc/genericfire", x, y)
	
with other
{
	movespeed = hsp
	reset_anim(spr_player_fireass)
	state = states.fireass
	vsp = -20
}
