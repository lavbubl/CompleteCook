var _char_snd = obj_player.character == characters.peppino ? v_pep_scream : v_noise_scream
if !audio_is_playing(_char_snd)
{
	scr_sound_pitched(_char_snd)
	scr_sound(sfx_fireass)
}
scr_sound(sfx_genericfire)
	
with other
{
	movespeed = hsp
	state = states.fireass
	vsp = -20
	reset_anim(spr_player_fireass)
}
