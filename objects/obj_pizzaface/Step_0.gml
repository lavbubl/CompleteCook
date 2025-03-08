var playerid = obj_player

if (!instance_exists(playerid))
	exit
	
var _move = true

with obj_player
{
	if (state == states.actor)
		_move = false
}

if !instance_exists(obj_treasure)
{
	if image_alpha >= 1
	{
		if (!obj_fade.fade && obj_player.state != states.actor)
		{
			if _move
			{
				var dir = point_direction(x, y, playerid.x, playerid.y)
				x += lengthdir_x(maxspeed, dir)
				y += lengthdir_y(maxspeed, dir)
			}
		}
	}
	else
		image_alpha += 0.01
}
else
{
	x = -200
	y = -200
}

if !_move
	image_alpha = approach(image_alpha, 0, 0.1)

if (_move && place_meeting(x, y, playerid) && playerid.state != states.actor && !obj_fade.fade && !instance_exists(obj_rank) && image_alpha >= 1)
{
	with playerid
	{
		door_type = fade_types.generic
		hsp = 0
		vsp = 0
		movespeed = 0
		spawn = "a"
		state = states.actor
		sprite_index = spr_player_timesup
		image_index = 0
		if obj_music.mu != noone
			audio_stop_sound(obj_music.mu)
		scr_sound(sfx_explosion)
		scr_sound(sfx_groundpound)
		scr_sound(mu_timesup)
		scr_sound(sfx_timesup)
	}
	room_goto(rm_timesup)
	instance_destroy()
}

if maxspeed < 3 && image_alpha >= 1
	maxspeed += 0.01
