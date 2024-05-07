if (global.levelcomplete && (!global.freezercutscene))
{
	global.levelcomplete = 0
	with (obj_player1)
	{
		other.backx = backtohubstartx
		other.backy = backtohubstarty
	}
	currentroom = room
	dragonactor = 118689
	scene_info = [[cutscene_medieval_start], [cutscene_waitfor_sprite, obj_player1], [function()
	{
		with (obj_actor)
		{
			if (id != other.dragonactor)
			{
				sprite_index = spr_idle
				visible = true
			}
		}
		cutscene_end_action()
		exit;
	}
], [cutscene_set_player_visible, 0], [cutscene_player_idleanim], [cutscene_player_float, 1], [cutscene_player_pos_lerp, 832, 288, 0.07], [cutscene_wait, 40], [function()
	{
		with (dragonactor)
		{
			image_speed = 0.35
			sprite_index = spr_cheesedragon_goingup
			repeat (3)
				create_debris(x, y, spr_icedebris)
		}
		cutscene_end_action()
		exit;
	}
], [function()
	{
		with (dragonactor)
		{
			y -= 5
			if (y < -100)
			{
				with (other)
					cutscene_end_action()
			}
		}
		exit;
	}
], [cutscene_change_room, hub_grandpizzardtower], [cutscene_set_player_visible, 0], [cutscene_set_player_pos, 1407, 415], [cutscene_wait, 20], [function()
	{
		dragonactor = instance_create(1407, -125, obj_actor)
		dragonactor.sprite_index = spr_cheesedragon_idle
		dragonactor.image_speed = 0.35
		cutscene_end_action()
		exit;
	}
], [function()
	{
		with (dragonactor)
		{
			y += 5
			if place_meeting(x, (y + 128), obj_solid)
			{
				sprite_index = spr_cheesedragon_stomp
				image_index = 0
				with (other)
					cutscene_end_action()
			}
		}
		exit;
	}
], [function()
	{
		with (dragonactor)
		{
			y += 5
			if place_meeting(x, (y + 5), obj_solid)
			{
				while (!(place_meeting(x, (y + 1), obj_solid)))
					y++
				with (other)
					cutscene_end_action()
			}
		}
		exit;
	}
], [cutscene_soundeffect, 27], [cutscene_camera_shake, 5, (3 / room_speed)], [function()
	{
		with (dragonactor)
		{
			if (floor(image_index) == (image_number - 1))
			{
				sprite_index = spr_cheesedragon_idle
				with (other)
					cutscene_end_action()
			}
		}
		exit;
	}
], [cutscene_wait, 50], [function()
	{
		with (obj_freezerblock)
			instance_destroy()
		cutscene_end_action()
		exit;
	}
], [cutscene_wait, 50], [cutscene_change_room, hub_plains], [cutscene_set_player_visible, 0], [cutscene_set_player_pos, 190, 600], [cutscene_soundeffect, 27], [cutscene_camera_shake, 5, (3 / room_speed)], [cutscene_wait, 50], [function()
	{
		with (obj_freezerblock)
			instance_destroy()
		cutscene_end_action()
		exit;
	}
], [cutscene_wait, 50], [cutscene_change_room, currentroom], [cutscene_set_player_pos, backx, backy], [cutscene_set_player_visible, 1], [cutscene_player_float, 0], [function()
	{
		instance_destroy(obj_actor)
		with (obj_player)
		{
			if (object_index != obj_player2 or global.coop)
			{
				state = states.normal
				x = backtohubstartx
				y = backtohubstarty
			}
		}
		global.levelcomplete = 0
		global.freezercutscene = 1
		quick_ini_write_real(get_savefile_ini(), "cutscene", "freezer", 1)
		cutscene_end_action()
		exit;
	}
], [cutscene_save_game]]
}
else if global.levelcomplete
{
	global.levelcomplete = 0
	scene_info = [[cutscene_save_game]]
}
else
	scene_info = [[cutscene_wait, 20]]
