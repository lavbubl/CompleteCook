function scr_monster_activate()
{
	with (obj_monster)
	{
		if (state == states.robotidle)
			state = states.robotintro
	}
	with (obj_monstergate)
	{
		if (!active)
		{
			active = 1
			instance_destroy(solidID)
			solidID = -4
			image_speed = 0.35
		}
	}
	warbg_init()
}

function get_triangle_points(argument0, argument1, argument2, argument3, argument4)
{
	var x2 = (argument0 + lengthdir_x(argument3, (argument2 - argument4)))
	var y2 = (argument1 + lengthdir_y(argument3, (argument2 - argument4)))
	var x3 = (argument0 + lengthdir_x(argument3, (argument2 + argument4)))
	var y3 = (argument1 + lengthdir_y(argument3, (argument2 + argument4)))
	return [x2, y2, x3, y3];
}

function scr_monster_detect(argument0, argument1, argument2)
{
	var _dir = (image_xscale > 0 ? argument2.x > x : argument2.x < x)
	if (_dir && argument2.x < (x + argument0) && argument2.x > (x - argument0) && argument2.y < (y + argument1) && argument2.y > (y - argument1))
	{
		var detect = 0
		if (argument2.y > (y - 200))
		{
			with (argument2)
			{
				if (state != states.crouch or ((!(scr_solid(x, (y - 24)))) && (!(place_meeting(x, (y - 24), obj_platform)))))
					detect = 1
			}
		}
		if detect
			return true;
	}
	return false;
}

function scr_puppet_detect()
{
	with (obj_player)
	{
		if ((object_index != obj_player2 or global.coop) && (!(place_meeting(x, y, obj_puppetsafezone))))
			return id;
	}
	return -4;
}

function scr_puppet_appear(argument0)
{
	var _xdir = 96
	var i = 0
	while collision_line(argument0.x, argument0.y, (argument0.x + (_xdir * argument0.xscale)), argument0.y, obj_solid, false, true)
	{
		_xdir--
		
		i++
		if (i > room_width)
		{
			x = argument0.x
			break
		}
	}
	
	x = (argument0.x + (abs(_xdir) * argument0.xscale))
	y = argument0.y
	state = states.robotchase
	substate = states.fall
	playerid = argument0
	
	while place_meeting(x, y, obj_solid)
	{
		x += (argument0.x > x ? 1 : -1)
		
		i++
		if (i > room_width)
		{
			x = argument0.x
			break
		}
	}
	
	var _col = collision_line(x, y, x, (y - room_height), obj_solid, true, false)
	if (_col != -4)
	{
		while (!(place_meeting(x, (y - 1), obj_solid)))
			y--
	}
}

function scr_monsterinvestigate(argument0, argument1, argument2)
{
	targetplayer = instance_nearest(x, y, obj_player)
	image_speed = 0.35
	switch investigatestate
	{
		case 0:
		case 1:
			sprite_index = argument1
			hsp = (image_xscale * argument0)
			if (place_meeting((x + sign(hsp)), y, obj_monstersolid) && ((!(place_meeting((x + sign(hsp)), y, obj_monsterslope))) or place_meeting((x + sign(hsp)), (y - 4), obj_solid)))
			{
				investigatestate++
				image_xscale *= -1
			}
			if (investigatestate == 1)
			{
				if ((image_xscale > 0 && x > (room_width / 2)) or (image_xscale < 0 && x < (room_width / 2)))
				{
					investigatestate = 2
					waitbuffer = 100
				}
			}
			break
		case 2:
			sprite_index = argument2
			hsp = 0
			if (waitbuffer > 0)
				waitbuffer--
			else
			{
				state = states.robotroaming
				image_xscale *= -1
				instance_create(x, y, obj_patroller)
			}
			break
	}

	if scr_monster_detect(300, room_height, targetplayer)
		state = states.robotchase
}

function scr_monster_detect_audio()
{
	if scr_monster_audio_check()
	{
		if (!(point_in_camera(x, y, view_camera[0])))
		{
			state = states.robotinvestigate
			investigatestate = 0
		}
		else
		{
			targetplayer = instance_nearest(x, y, obj_player)
			if (object_index == obj_blobmonster)
			{
				state = states.fall
				gravdir *= -1
				chase = 0
			}
			else
				state = states.robotchase
		}
	}
}

function scr_monster_audio_check()
{
	if (audio_is_playing(sfx_groundpound) or audio_is_playing(sfx_scream5))
		return true;
	return false;
}
