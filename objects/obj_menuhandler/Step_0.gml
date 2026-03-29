update_input();

var abletoinput = !instance_exists(obj_options) && !instance_exists(obj_quitgame) && state == 0

if menu_dark
{
	if input.accept.pressed && dark_state == 0
	{
		scr_sound(sfx_menulight)
		audio_sound_loop_end(mu, audio_sound_length(mu_mainmenu))
		alarm[1] = 80
		alarm[2] = 50
		alarm[3] = 20 //forced to do to recreate fmod event
		dark_state = 1
	}
	exit;
}

if state == 0 && abletoinput
	cur_selected = clamp(cur_selected + (-input.left.pressed + input.right.pressed), 1, array_length(tvs))

obj_menupeppino.cur_selected = self.cur_selected

optionsalpha = approach(optionsalpha, 1, 0.1)

if abletoinput
{
	obj_menupeppino.painless = false
	if input.deny.pressed
		instance_create(0, 0, obj_options)
	else if input.grab.pressed
		instance_create(0, 0, obj_quitgame)
}
else
	obj_menupeppino.painless = true
	
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
					image_index = 0
					sprite_index = sprs.whitenoise
					audio_sound_gain(other.static_snd, 1, 0)
					scr_sound(sfx_step)
					break;
				case 1:
					var _image_number = sprite_get_number(sprite_index)
					if (save_exists) {
						if (floor(image_index) == _image_number - 1) {
							state++
							reset_anim(sprs.selected)
							audio_sound_gain(other.static_snd, 0, 0)
						}
					}
					else {
						if (floor(image_index) == _image_number - 1)
							image_index = 2
					}
					break;
			}
			if other.input.accept.pressed && other.state == 0 && abletoinput
			{
				audio_stop_sound(sfx_menustatic)
				reset_anim(sprs.confirm)
				scr_sound(sfx_collectbig)
				scr_sound(choose(sfx_fileselect1, sfx_fileselect2, sfx_fileselect3))
				audio_stop_sound(mu_mainmenu)
				global.savefile = filename
				state = 2
				
				with obj_menupeppino
				{
					switch cur_selected
					{
						case 1:
							sprite_index = spr_titlepep_left
							break;
						case 2:
							sprite_index = spr_titlepep_middle
							break;
						case 3:
							sprite_index = spr_titlepep_right
							break;
					}
					cur_anim_num = cur_selected
					alarm[0] = -1
				}
				
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
