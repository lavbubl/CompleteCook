get_input()

cur_selected = clamp(cur_selected + (-key_left.pressed + key_right.pressed), 1, array_length(tvs))

obj_menupeppino.cur_selected = self.cur_selected

for (var i = 0; i < array_length(tvs); i++) 
{
	var cur_tv = tvs[i]
	
	if cur_selected - 1 == i
	{
		with cur_tv
		{
			switch state
			{
				case 0:
					state++
					buffer = 50
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
				case 2:
					if uikey_accept.pressed
						reset_anim(sprs.confirm)
					break;
			}
		}
	}
	else
	{
		cur_tv.state = 0
		cur_tv.sprite_index = cur_tv.sprs.off
	}
}
