var playerid = obj_player;

if (!instance_exists(playerid))
	exit;
	
var _move = true;

with obj_player
{
	if (state == states.actor)
		_move = false;
}

if !instance_exists(obj_treasure)
{
	if image_alpha >= 1
	{
		if (!obj_fade.fade && obj_player.state != states.actor)
		{
			if _move
			{
				var dir = point_direction(x, y, playerid.x, playerid.y);
				x += lengthdir_x(maxspeed, dir);
				y += lengthdir_y(maxspeed, dir);
			}
		}
	}
	else
		image_alpha += 0.01;
}
else
{
	x = -200;
	y = -200;
}

if !_move
	image_alpha = approach(image_alpha, 0, 0.1)

/*if (_move && place_meeting(x, y, playerid) && !playerid.cutscene && playerid.state != states.actor && !instance_exists(obj_fade) && !instance_exists(obj_endlevelfade) && image_alpha >= 1)
{
	
	/*
	if (instance_exists(obj_toppinwarrior))
	{
		if (variable_global_exists("toppinwarriorid1") && instance_exists(global.toppinwarriorid1))
			instance_destroy(global.toppinwarriorid1);
		else if (variable_global_exists("toppinwarriorid2") && instance_exists(global.toppinwarriorid2))
			instance_destroy(global.toppinwarriorid2);
		else if (variable_global_exists("toppinwarriorid3") && instance_exists(global.toppinwarriorid3))
			instance_destroy(global.toppinwarriorid3);
		else if (variable_global_exists("toppinwarriorid4") && instance_exists(global.toppinwarriorid4))
			instance_destroy(global.toppinwarriorid4);
		else if (variable_global_exists("toppinwarriorid5") && instance_exists(global.toppinwarriorid5))
			instance_destroy(global.toppinwarriorid5);
		instance_create(x, y, obj_flash);
		global.seconds = 59;
		obj_camera.alarm[1] = 60;
		obj_camera.ded = false;
		instance_destroy();
	}
	else if (!instance_exists(obj_toppinwarrior))
	{
	*/
	
/*	with playerid
	{
		instance_destroy(obj_fadeout);
		targetDoor = "A";
		room = timesuproom;
		state = states.timesup;
		sprite_index = spr_Timesup;
		image_index = 0;
		if isgustavo
			sprite_index = spr_player_ratmounttimesup;
		visible = true;
		image_blend = c_white;
		//audio_stop_all();
		stop_music();
		fmod_event_one_shot("event:/music/timesup");
	}
	instance_destroy();
}
if maxspeed < 3 && image_alpha >= 1
	maxspeed += 0.01; must... rewrite.. */