if (room == editor_room)
	exit;
player = (obj_player1.spotlight == 1 ? obj_player1 : obj_player2)
if (!instance_exists(obj_pizzaball))
	targetgolf = noone
if (collect_shake > 0)
	collect_shake *= 0.5
if (healthshaketime > 0)
{
	healthshaketime--
	healthshake = random_range(-2, 2)
}
if (healthshaketime == 0)
	healthshake = 0
if (obj_player1.character == "V")
{
	if (healthold != global.playerhealth)
	{
		instance_create(hppos[healthold][0], hppos[healthold][1], obj_hpdrop)
		healthold = global.playerhealth
	}
}
else if (obj_player1.character == "P")
{
	if (healthold != global.hp)
	{
		playerhealthup = healthold < global.hp
		healthshaketime = 30
		healthold = global.hp
	}
}
if (global.coop == true)
{
	var p1 = player
	var p2 = (obj_player1.spotlight == 1 ? obj_player2 : obj_player1)
	p2pdistance = point_distance(p1.x, 0, p2.x, 0)
	p2pdistancex = (p1.x >= p2.x ? ((-p2pdistance) / 5) : (p2pdistance / 5))
}
else
	p2pdistancex = 0
if (floor(image_index) == 10)
	shoving = 0
if (room == strongcold_endscreen or room == rm_eggplantdisclaimer or room == rm_levelselect or room == rank_room or room == timesuproom or room == Realtitlescreen or room == characterselect or room == hub_loadingscreen)
	visible = false
else
	visible = true
if (instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud))
	visible = false
if (global.combo >= 10)
	global.SAGEcombo10 = 1
if (global.combo > 0)
{
	alarm[4] = 2
	global.savedcombo = global.combo
	var ct = global.combotime
	if (ct <= 40)
	{
		if (alarm[5] == -1)
		{
			if (ct >= 20)
				alarm[5] = 12
			else
				alarm[5] = 5
		}
	}
	else
		combobubblevisible = 1
}
if (shoving == 1 && image_index >= 3 && bang == 0)
{
	with (instance_create(x, y, obj_fallingHUDface))
	{
		if ((obj_player1.spotlight == 0 && obj_player1.character == "P") or (obj_player1.spotlight == 1 && obj_player2.character == "P"))
		{
			sprite = spr_pepinoHUDscream
			hsp = random_range(-1, -5)
		}
		else
		{
			sprite = spr_noiseHUD_panic
			hsp = random_range(1, 5)
		}
	}
	bang = 1
}
if (shoving == 0)
	bang = 0
if (global.seconds <= 0 && global.minutes <= 0 && ded == 0)
{
	alarm[1] = -1
	if (global.miniboss or instance_exists(obj_toppinwarrior))
		alarm[2] = 1
	else
		alarm[3] = 1
	ded = 1
}
if (global.seconds > 59)
{
	global.minutes += 1
	global.seconds -= 59
}
if global.timedgatetimer
{
	if (global.timedgatetime > 0)
		global.timedgatetime--
	else
	{
		global.timedgatetime = 0
		global.timedgatetimer = 0
	}
}
if (!instance_exists(obj_ghostcollectibles))
{
	if ((global.panic == true && global.minutes < 1) or player.sprite_index == spr_player_timesup)
	{
		shake_mag = 2
		shake_mag_acc = (3 / room_speed)
	}
	else if (global.panic == true && basement == 0)
	{
		shake_mag = 2
		shake_mag_acc = (3 / room_speed)
	}
}
if (shake_mag > 0)
{
	shake_mag -= shake_mag_acc
	if (shake_mag < 0)
		shake_mag = 0
}
detachedby = -1
detach = 0
follow_golf = 0
if (instance_exists(player) && player.state != states.timesup && !lock && player.state != states.gameover && (!follow_golf) && (!detach))
{
	if (room != custom_lvl_room)
	{
		var target = player
		var coopdistance = (distance_to_object(obj_player2) / 2)
		if (player.state == states.mach2 or player.state == states.mach3)
		{
			var _targetcharge = (player.xscale * ((player.movespeed / 4) * 50))
			var _tspeed = 0.3
			chargecamera = Approach(chargecamera, _targetcharge, _tspeed)
		}
		else if ((abs(player.hsp) >= 16 or (player.state == states.chainsaw && player.tauntstoredmovespeed >= 16)) && player.state != states.climbwall && player.state != states.Sjump)
		{
			_targetcharge = (player.xscale * ((abs(player.movespeed) / 4) * 50))
			_tspeed = 2
			if ((_targetcharge > 0 && chargecamera < 0) or (_targetcharge < 0 && chargecamera > 0))
				_tspeed = 8
			chargecamera = Approach(chargecamera, _targetcharge, _tspeed)
		}
		else if (player.state == states.machslide)
			chargecamera = Approach(chargecamera, 0, 10)
		else
			chargecamera = Approach(chargecamera, 0, 6)
		var cam_width = camera_get_view_width(view_camera[0])
		var cam_height = camera_get_view_height(view_camera[0])
		if (targetgolf != noone && (!instance_exists(targetgolf)))
			targetgolf = noone
		if (targetgolf == noone)
		{
			if ((!global.coop) or room == characterselect or room == rm_levelselect or room == Realtitlescreen)
			{
				var cam_x = (((target.x - (cam_width / 2)) + chargecamera) + p2pdistancex)
				var cam_y = ((target.y - (cam_height / 2)) - 50)
				cam_x = clamp(cam_x, 0, (room_width - cam_width))
				cam_y = clamp(cam_y, 0, (room_height - cam_height))
				camera_zoom(1, 0.035)
			}
			else if (obj_player2.state != states.titlescreen)
			{
				cam_x = (((obj_player1.x + obj_player2.x) / 2) - (cam_width / 2))
				cam_y = (((obj_player1.y + obj_player2.y) / 2) - (cam_height / 2))
				var disx = (abs((obj_player1.x - obj_player2.x)) / coop_zoom_width)
				var disy = (abs((obj_player1.y - obj_player2.y)) / coop_zoom_height)
				var dis = max(disx, disy)
				dis = max(1, dis)
				camera_zoom(dis, 0.035)
			}
		}
		else
		{
			var _px = 0
			var _py = 0
			if global.coop
			{
				_px = obj_player2.x
				_py = obj_player2.y
			}
			cam_x = ((((obj_player1.x + targetgolf.x) + _px) / 2) - (cam_width / 2))
			cam_y = (((((obj_player1.y + targetgolf.y) + _py) / 2) - (cam_height / 2)) - 50)
			disx = (abs(((obj_player1.x - targetgolf.x) - _px)) / coop_zoom_width)
			disy = (abs(((obj_player1.y - targetgolf.y) - _py)) / coop_zoom_height)
			dis = max(disx, disy)
			dis = max(1, dis)
			camera_zoom(dis, 0.035)
		}
		if (shake_mag != 0)
		{
			cam_x += irandom_range((-shake_mag), shake_mag)
			cam_y += irandom_range((-shake_mag), shake_mag)
		}
		camera_set_view_pos(view_camera[0], cam_x, (cam_y + irandom_range((-shake_mag), shake_mag)))
	}
	else
	{
		target = player
		coopdistance = (distance_to_object(obj_player2) / 2)
		if (player.state == states.mach3 or player.state == states.rideweenie or player.state == states.machroll)
		{
			if (chargecamera > (player.xscale * 100))
				chargecamera -= 2
			if (chargecamera < (player.xscale * 100))
				chargecamera += 2
		}
		else
		{
			if (chargecamera > 0)
				chargecamera -= 2
			if (chargecamera < 0)
				chargecamera += 2
		}
		cam_width = camera_get_view_width(view_camera[0])
		cam_height = camera_get_view_height(view_camera[0])
		cam_x = (((target.x - (cam_width / 2)) + chargecamera) + p2pdistancex)
		cam_y = (target.y - (cam_height / 2))
		var _room_x = 0
		var _room_y = 0
		var _room_width = room_width
		var _room_height = room_height
		if bound_camera
		{
			_room_x = obj_player.cam.x
			_room_y = obj_player.cam.y
			_room_width = obj_player.cam_width
			_room_height = obj_player.cam_height
			if (obj_player.cam != noone)
			{
				instance_deactivate_object(obj_minijohn_hitbox)
				instance_deactivate_object(obj_pepgoblin_kickhitbox)
				instance_deactivate_object(obj_forkhitbox)
				instance_deactivate_object(obj_baddiecollisionbox)
				instance_deactivate_object(obj_baddie)
				instance_activate_object(obj_inputAssigner)
				offset = 64
				instance_activate_region((_room_x - offset), (_room_y - offset), (_room_width + offset), (_room_height + offset), true)
			}
		}
		if (shake_mag != 0)
		{
			cam_x += irandom_range((-shake_mag), shake_mag)
			cam_y += irandom_range((-shake_mag), shake_mag)
		}
		camera_set_view_pos(view_camera[0], clamp(cam_x, 0, (_room_width - cam_width)), (clamp(cam_y, 0, (_room_height - cam_height)) + irandom_range((-shake_mag), shake_mag)))
	}
}
else if follow_golf
{
	if (instance_exists(targetgolf) && targetgolf.thrown == true)
	{
		var _xx = targetgolf.x
		var _yy = targetgolf.y
		var _freecamera = 0
		_room_x = 0
		_room_y = 0
		var _width = room_width
		var _height = room_height
		if (room == custom_lvl_room)
		{
			if (obj_player1.cam != noone)
			{
				_room_x = obj_player1.cam.x
				_room_y = obj_player1.cam.y
				_width = obj_player1.cam_width
				_height = obj_player1.cam_height
			}
			else
				_freecamera = 1
		}
		_width -= camera_get_view_width(view_camera[0])
		_height -= camera_get_view_height(view_camera[0])
		_xx -= (camera_get_view_width(view_camera[0]) / 2)
		_yy -= (camera_get_view_height(view_camera[0]) / 2)
		if _freecamera
			camera_set_view_pos(view_camera[0], _xx, _yy)
		else
			camera_set_view_pos(view_camera[0], clamp(_xx, _room_x, _width), clamp(_yy, _room_y, _height))
	}
	else
	{
		targetgolf = noone
		follow_golf = 0
	}
}
else if detach
{
	camera_zoom(max((room_width / original_cam_width), (room_height / original_cam_height)), 0.035)
	_width = room_width
	_height = room_height
	_width -= camera_get_view_width(view_camera[0])
	_height -= camera_get_view_height(view_camera[0])
	_xx = camera_get_view_x(view_camera[0])
	_yy = camera_get_view_y(view_camera[0])
	_xx = (obj_player1.x - (camera_get_view_width(view_camera[0]) / 2))
	_yy = (obj_player1.y - (camera_get_view_height(view_camera[0]) / 2))
	camera_set_view_pos(view_camera[0], _xx, _yy)
}
