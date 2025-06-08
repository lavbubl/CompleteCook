if !audio_is_playing(v_peppinoscream)
{
	scr_sound(v_peppinoscream)
	scr_sound(sfx_fireass)
}
scr_sound(sfx_genericfire)
	
with other
{
	movespeed = hsp
	reset_anim(spr_player_fireass)
	state = states.fireass
	vsp = -20
}
