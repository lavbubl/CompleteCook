if (room == rm_editor)
	exit;
var playerid = instance_place(x, (y - 1), obj_player)
with (playerid)
{
	if (state != states.boots && state != states.gameover && state != states.rideweenie && state != states.gotoplayer)
	{
		var _pindex = (object_index == obj_player1 ? 0 : 1)
		GamepadSetVibration(_pindex, 1, 1, 0.85)
		state = states.fireass
		vsp = -20
		sprite_index = spr_fireass
		image_index = 0
		movespeed = hsp
		if (!audio_is_playing(sfx_scream5))
			scr_soundeffect(sfx_scream5)
	}
}
