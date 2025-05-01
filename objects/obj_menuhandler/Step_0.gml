get_input()

if state == 0
	cur_selected = clamp(cur_selected + (-key_left.pressed + key_right.pressed), 1, array_length(tvs))

obj_menupeppino.cur_selected = self.cur_selected

for (var i = 0; i < array_length(tvs); i++) 
{
	var cur_tv = tvs[i]
	
	if cur_selected - 1 == i
	{
		with cur_tv
		{
			obj_menupeppino.p_ix = pal_ix 
			obj_menupeppino.p_spr = pat_spr
			
			obj_player.pal_select = pal_ix 
			obj_player.pattern_spr = pat_spr
			switch state
			{
				case 0:
					state++
					buffer = 25
					sprite_index = sprs.whitenoise
					break;
				case 1:
					if buffer > 0	
						buffer--
					else
					{
						state++
						reset_anim(sprs.selected)
					}
					break;
			}
			if other.uikey_accept.pressed && other.state == 0
			{
				reset_anim(sprs.confirm)
				scr_sound(sfx_collectbig)
				scr_sound(choose(sfx_fileselect1, sfx_fileselect2, sfx_fileselect3))
				audio_stop_sound(mu_mainmenu)
				global.savefile = filename
				state = 2
				
				with other
				{
					state = 1
					alarm[0] = 240
				}
			}
		}
	}
	else
	{
		cur_tv.state = 0
		cur_tv.sprite_index = cur_tv.sprs.off
	}
}
