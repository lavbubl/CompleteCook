if (state == states.punch)
{
	with (other)
	{
		if (state != states.boots && state != states.gameover && state != states.rideweenie && state != states.gotoplayer)
		{
			var _pindex = (object_index == obj_player1 ? 0 : 1)
			GamepadSetVibration(_pindex, 1, 1, 0.85)
			if (state != states.fireass)
				tv_push_prompt_once(tv_create_prompt("This is the fireass transformation text", tvprompt.transfo, spr_tv_fireass, 3), "fireass")
			state = states.fireass
			vsp = -25
			sprite_index = spr_fireass
			image_index = 0
			movespeed = hsp
			if (!audio_is_playing(sfx_scream5))
				scr_soundeffect(sfx_scream5)
		}
	}
}
