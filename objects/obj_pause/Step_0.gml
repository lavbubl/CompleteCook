if ((!pause) && obj_player1.key_start)
{
	var _cutscenehandler = 0
	with (obj_cutscene_handler)
	{
		if (!loop)
			_cutscenehandler = 1
	}
	with (obj_secretportal)
	{
		if touched
			_cutscenehandler = 1
	}
	with (obj_secretportalstart)
		_cutscenehandler = 1
	if (obj_savesystem.state == 0 && (!_cutscenehandler) && room != rank_room && room != Realtitlescreen && room != timesuproom)
	{
		selected = 0
		if (!instance_exists(obj_pausefadeout))
			instance_create(x, y, obj_pausefadeout)
	}
}
with (obj_player1)
{
	other.paletteselect = paletteselect
	other.spr_palette = spr_palette
}
if (pause && (!instance_exists(obj_option)))
{
	fade = Approach(fade, 1, 0.1)
	scr_getinput()
	application_surface_draw_enable(true)
	var prevselected = selected
	moveselect = ((-key_up2) + key_down2)
	selected += moveselect
	if (moveselect != 0 && selected >= 0 && selected <= 2)
		scr_soundeffect(sfx_step)
	selected = clamp(selected, 0, (array_length(pause_menu) - 1))
	if (prevselected != selected)
	{
		switch selected
		{
			case 0:
				peppino_sprite = spr_player_idle
				break
			case 1:
				peppino_sprite = spr_file1
				break
			case 2:
				peppino_sprite = spr_player_panic
				break
			case 3:
				peppino_sprite = spr_player_winding
				break
		}

		peppino_sprite_number = sprite_get_number(peppino_sprite)
		peppino_index = 0
	}
	if key_jump
	{
		switch selected
		{
			case 0:
				if (!instance_exists(obj_pausefadeout))
					instance_create(x, y, obj_pausefadeout)
				break
			case 2:
				var roomname = room_get_name(room)
				if (!global.snickchallenge)
				{
					var rm = -4
					rm = global.leveltorestart
					ds_list_clear(global.saveroom)
					ds_list_clear(global.baddieroom)
					if (rm != -4 && rm != -1)
					{
						instance_activate_all()
						global.levelreset = 0
						scr_playerreset()
						global.levelreset = 1
						scr_room_goto(rm)
						pause = 0
						obj_player1.targetDoor = "A"
						if instance_exists(obj_player2)
							obj_player2.targetDoor = "A"
					}
					else
						scr_soundeffect(sfx_enemyprojectile)
				}
				break
			case 1:
				scr_soundeffect(sfx_enemyprojectile)
				instance_create(x, y, obj_option)
				break
			case 3:
				if (room == hub_room1 or room == characterselect or room == cowboytask or room == Titlescreen or room == Scootertransition or room == rm_levelselect or string_copy(room_get_name(room), 1, 3) == "hub")
				{
					pause = 0
					instance_activate_all()
					room = Titlescreen
					scr_playerreset()
					obj_player1.targetDoor = "A"
					if instance_exists(obj_player2)
						obj_player2.targetDoor = "A"
					global.cowboyhat = 0
					global.coop = false
				}
				else
				{
					pause = 0
					instance_activate_all()
					scr_playerreset()
					global.levelreset = 1
					obj_player1.targetDoor = "D"
					if instance_exists(obj_player2)
						obj_player2.targetDoor = "D"
					room = rm_levelselect
					alarm[0] = 2
				}
				break
		}

	}
	cursor_index += 0.35
	if (cursor_index > cursor_sprite_number)
	{
		var p = (cursor_index - floor(cursor_index))
		cursor_index = p
	}
	peppino_index += 0.35
	if (peppino_index > peppino_sprite_number)
	{
		p = (peppino_index - floor(peppino_index))
		peppino_index = p
	}
	for (var i = 0; i < array_length(toppin_sprite); i++)
	{
		toppin_index[i] += 0.35
		if (toppin_index[i] > toppin_number[i])
		{
			var t = toppin_index[i]
			p = (t - floor(t))
			toppin_index[i] = p
		}
	}
	toppin_has[0] = global.cheesefollow
	toppin_has[1] = global.pineapplefollow
	toppin_has[2] = global.sausagefollow
	toppin_has[3] = global.shroomfollow
	toppin_has[4] = global.tomatofollow
}
if (!pause)
	fade = Approach(fade, 0, 0.1)