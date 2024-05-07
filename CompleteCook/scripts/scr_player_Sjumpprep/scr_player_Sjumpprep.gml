function scr_player_Sjumpprep()
{
	switch character
	{
		case "P":
		case "V":
			if (sprite_index == spr_superjumppreplight or sprite_index == spr_superjumpright or sprite_index == spr_superjumpleft)
				move = (key_left + key_right)
			else
				move = xscale
			if (!(place_meeting(x, (y + 1), obj_railparent)))
				hsp = (move * movespeed)
			else
			{
				var _railinst = instance_place(x, (y + 1), obj_railparent)
				hsp = ((move * movespeed) + (_railinst.movespeed * _railinst.dir))
			}
			if (sprite_index == spr_superjumpprep && movespeed > 0)
				movespeed -= 1
			if (floor(image_index) == (image_number - 1) && sprite_index == spr_superjumpprep)
				sprite_index = spr_superjumppreplight
			if (sprite_index == spr_superjumppreplight)
				movespeed = 2
			if (sprite_index != spr_superjumpprep)
			{
				if (move != 0 && (sprite_index == spr_superjumppreplight or sprite_index == spr_superjumpright or sprite_index == spr_superjumpleft))
				{
					if (xscale == 1)
					{
						if key_right
							sprite_index = spr_superjumpright
						if (-key_left)
							sprite_index = spr_superjumpleft
					}
					if (xscale == -1)
					{
						if key_right
							sprite_index = spr_superjumpleft
						if (-key_left)
							sprite_index = spr_superjumpright
					}
				}
				else
					sprite_index = spr_superjumppreplight
			}
			if ((!key_up) && grounded && (character == "S" or sprite_index == spr_superjumppreplight or sprite_index == spr_superjumpleft or sprite_index == spr_superjumpright) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
			{
				scr_soundeffect(sfx_superjumprelease)
				instance_create(x, y, obj_explosioneffect)
				sprite_index = spr_superjump
				state = states.Sjump
				vsp = -17
				image_index = 0
			}
			image_speed = 0.35
			break
		case "N":
			hsp = 0
			vsp = 0
			pogochargeactive = 0
			pogocharge = 50
			if (floor(image_index) == (image_number - 1))
			{
				if (sprite_index == spr_playerN_jetpackstart)
				{
					if (pizzapepper == 0)
					{
						state = states.mach3
						sprite_index = spr_playerN_jetpackboost
						instance_create(x, y, obj_jumpdust)
						movespeed = 15
					}
					else
					{
						state = states.mach3
						sprite_index = spr_crazyrun
						instance_create(x, y, obj_jumpdust)
						movespeed = 21
					}
				}
				else if (sprite_index == spr_superjumpprep)
				{
					scr_soundeffect(sfx_superjumprelease)
					instance_create(x, y, obj_explosioneffect)
					sprite_index = spr_superjump
					state = states.Sjump
					vsp = -15
				}
			}
			if (sprite_index == spr_playerN_jetpackstart)
				image_speed = 0.5
			else
				image_speed = 0.3
			break
	}

	if (!audio_is_playing(superjumpholdsnd) && !audio_is_playing(superjumpprepsnd))
	{
		superjumpholdsnd = audio_play_sound(sfx_superjumphold, 1, false)
		sfx_gain(superjumpholdsnd)
	}
	exit;
}

