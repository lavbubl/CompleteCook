function scr_pizzagoblin_throw()
{
	if (!variable_global_exists("throw_frame"))
	{
		global.throw_frame = 0
		global.throw_frame[obj_pizzagoblin] = 11
		global.throw_frame[obj_canongoblin] = 13
		global.throw_frame[obj_noisegoblin] = 18
		global.throw_frame[obj_cheeserobot] = 6
		global.throw_frame[obj_spitcheese] = 2
		global.throw_frame[obj_bazookabaddie] = 7
		global.throw_frame[obj_trash] = 2
		global.throw_frame[obj_invtrash] = 2
		global.throw_frame[obj_robot] = 2
		global.throw_frame[obj_kentukykenny] = 8
		global.throw_frame[obj_pizzard] = 6
		global.throw_frame[obj_pepgoblin] = 3
		global.throw_frame[obj_pepbat] = 8
		global.throw_frame[obj_swedishmonkey] = 15
		global.throw_frame[obj_rancher] = 10
		global.throw_frame[obj_pickle] = 2
		global.throw_frame[obj_tank] = 6
		global.throw_frame[obj_thug_blue] = 9
		global.throw_frame[obj_thug_green] = 9
		global.throw_frame[obj_thug_red] = 9
		global.throw_frame[obj_smokingpizzaslice] = 13
		global.throw_frame[obj_miniufo] = 3
		global.throw_frame[obj_kentukybomber] = 7
		global.throw_frame[obj_miniufo_grounded] = 11
		
		global.throw_sprite = 0
		global.throw_sprite[obj_pizzagoblin] = spr_pizzagoblin_throwbomb
		global.throw_sprite[obj_canongoblin] = spr_canongoblin_throwbomb
		global.throw_sprite[obj_noisegoblin] = spr_archergoblin_shoot
		global.throw_sprite[obj_cheeserobot] = spr_cheeserobot_attack
		global.throw_sprite[obj_spitcheese] = spr_spitcheese_spit
		global.throw_sprite[obj_bazookabaddie] = spr_tank_shoot
		global.throw_sprite[obj_trash] = spr_trash_throw
		global.throw_sprite[obj_invtrash] = spr_invtrash_throw
		global.throw_sprite[obj_robot] = spr_robot_attack
		global.throw_sprite[obj_kentukykenny] = spr_kentukykenny_throw
		global.throw_sprite[obj_pizzard] = spr_pizzard_shoot
		global.throw_sprite[obj_pepgoblin] = spr_pepgoblin_kick
		global.throw_sprite[obj_pepbat] = spr_pepbat_kick
		global.throw_sprite[obj_swedishmonkey] = spr_swedishmonkey_eat
		global.throw_sprite[obj_rancher] = spr_ranch_shoot
		global.throw_sprite[obj_pickle] = spr_pickle_attack
		global.throw_sprite[obj_tank] = spr_tank_shoot
		global.throw_sprite[obj_thug_blue] = spr_shrimp_knife
		global.throw_sprite[obj_thug_green] = spr_shrimp_knife
		global.throw_sprite[obj_thug_red] = spr_shrimp_knife
		global.throw_sprite[obj_smokingpizzaslice] = spr_pizzaslug_cough
		global.throw_sprite[obj_miniufo] = spr_ufolive_shoot
		global.throw_sprite[obj_kentukybomber] = spr_kentukybomber_attack
		global.throw_sprite[obj_miniufo_grounded] = spr_ufogrounded_shoot
		
		global.reset_timer = 0
		global.reset_timer[obj_pizzagoblin] = 200
		global.reset_timer[obj_canongoblin] = 200
		global.reset_timer[obj_noisegoblin] = 200
		global.reset_timer[obj_cheeserobot] = 200
		global.reset_timer[obj_spitcheese] = 100
		global.reset_timer[obj_bazookabaddie] = 400
		global.reset_timer[obj_trash] = 100
		global.reset_timer[obj_invtrash] = 100
		global.reset_timer[obj_robot] = 150
		global.reset_timer[obj_kentukykenny] = 200
		global.reset_timer[obj_pizzard] = 100
		global.reset_timer[obj_pepgoblin] = 200
		global.reset_timer[obj_pepbat] = 200
		global.reset_timer[obj_swedishmonkey] = 200
		global.reset_timer[obj_rancher] = 100
		global.reset_timer[obj_pickle] = 200
		global.reset_timer[obj_tank] = 100
		global.reset_timer[obj_thug_blue] = 60
		global.reset_timer[obj_thug_green] = 60
		global.reset_timer[obj_thug_red] = 60
		global.reset_timer[obj_smokingpizzaslice] = 10
		global.reset_timer[obj_miniufo] = 100
		global.reset_timer[obj_kentukybomber] = 100
		global.reset_timer[obj_miniufo_grounded] = 100
	}
	hsp = 0
	if place_meeting(x, y + 1, obj_railh)
		hsp = -5
	else if place_meeting(x, y + 1, obj_railh2)
		hsp = 5
	
	if floor(image_index) == image_number - 1
	{
		state = states.walk
		sprite_index = walkspr
	}
	
	if bombreset <= 0 && floor(image_index) == global.throw_frame[object_index]
	{
		bombreset = global.reset_timer[object_index]
		sprite_index = global.throw_sprite[object_index]
		if point_in_rectangle(x, y, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])))
			scr_soundeffect(sfx_enemyprojectile)
		
		switch object_index
		{
			case obj_pizzagoblin:
				with (instance_create(x, y, obj_pizzagoblinbomb))
				{
					defused = 1
					movespeed = 5
					image_xscale = other.image_xscale
					vsp = -10
					countdown = 80
				}
				break
			case obj_canongoblin:
				with (instance_create(x, y, obj_canongoblinbomb))
					image_xscale = other.image_xscale
				break
			case obj_noisegoblin:
				with (instance_create(x, y, obj_noisegoblin_arrow))
				{
				}
				break
			case obj_cheeserobot:
				with (instance_create(x, y, obj_cheeseblob))
				{
					sprite_index = spr_cheeserobot_goop
					image_xscale = other.image_xscale
					hsp = (other.image_xscale * 8)
					vsp = 0
					grav = 0
				}
				break
			case obj_spitcheese:
				if (spitcheesespr == spr_spitcheese_spit)
				{
					with (instance_create((x + (image_xscale * 6)), (y - 6), obj_spitcheesespike))
					{
						image_xscale = other.image_xscale
						hsp = (other.image_xscale * 5)
						vsp = -6
					}
				}
				else
				{
					with (instance_create((x + (image_xscale * 6)), (y - 6), obj_cheeseball))
					{
						image_xscale = other.image_xscale
						hsp = (other.image_xscale * 5)
						vsp = -6
					}
				}
				break
			case obj_trash:
			case obj_invtrash:
				with (instance_create((x + (image_xscale * 6)), (y - 6), obj_cheeseball))
				{
					image_xscale = other.image_xscale
					hsp = (other.image_xscale * 5)
					vsp = -4
				}
				break
			case obj_robot:
				with (instance_create((x + (image_xscale * 4)), y, obj_robotknife))
				{
					grav = 0
					image_xscale = other.image_xscale
					hsp = (other.image_xscale * 5)
				}
				break
			case obj_kentukykenny:
				with (instance_create(x, y, obj_kentukykenny_projectile))
					image_xscale = other.image_xscale
				break
			case obj_pizzard:
				with (instance_create(x, y, obj_pizzard_bolt))
					image_xscale = other.image_xscale
				break
			case obj_swedishmonkey:
				if elite
				{
					with (instance_create(x, y, obj_evilbanana))
					{
						baddieID = other.id
						image_xscale = other.image_xscale
						hsp = ((-other.image_xscale) * 4)
						vsp = -5
					}
				}
				else
				{
					with (instance_create(x, y, obj_slipnslide))
					{
						baddieID = other.id
						image_xscale = other.image_xscale
						hsp = ((-other.image_xscale) * 4)
						vsp = -5
					}
				}
				with (obj_slipnslide)
				{
					if (baddieID == other.id)
						banana += 1
				}
				with (obj_evilbanana)
				{
					if (baddieID == other.id)
						banana += 1
				}
				break
			case obj_pepgoblin:
				with (instance_create(x, y, obj_pepgoblin_kickhitbox))
				{
					baddieID = other.id
					image_xscale = other.image_xscale
				}
				break
			case obj_pepbat:
				with (instance_create(x, y, obj_pepgoblin_kickhitbox))
				{
					baddieID = other.id
					image_xscale = other.image_xscale
				}
				break
			case obj_pickle:
				attacking = 0
				with (instance_create(x, y, obj_forkhitbox))
				{
					ID = other.id
					image_xscale = other.image_xscale
					sprite_index = other.sprite_index
				}
				break
			case obj_tank:
				with (instance_create((x + (image_xscale * 6)), (y - 6), obj_canongoblinbomb))
				{
					image_xscale = other.image_xscale
					hsp = (other.image_xscale * 5)
				}
				break
			case obj_thug_blue:
			case obj_thug_red:
				with (instance_create((x + (8 * image_xscale)), y, obj_robotknife))
				{
					image_xscale = other.image_xscale
					hsp = (other.image_xscale * 5)
				}
				break
			case obj_rancher:
				with (instance_create((x + (image_xscale * 6)), (y + 26), obj_rancher_bullet))
					image_xscale = other.image_xscale
				break
			case obj_smokingpizzaslice:
				substate = choose(states.walk, states.idle, states.idle)
				if (substate == states.walk)
					image_xscale = choose(-1, 1, (-image_xscale))
				substate_buffer = substate_max
				with (instance_create((x + (50 * image_xscale)), (y + 20), obj_smokingprojectile))
					image_xscale = other.image_xscale
				break
			case obj_thug_green:
				with (instance_create((x + (8 * image_xscale)), y, obj_junkenemy))
				{
					image_xscale = other.image_xscale
					hsp = (other.image_xscale * 7)
					vsp = -8
				}
				break
			case obj_miniufo:
				instance_create(x, y, obj_warplaser)
				break
			case obj_miniufo_grounded:
				with (instance_create((x + (8 * image_xscale)), y, obj_enemybullet))
				{
					sprite_index = spr_ufogrounded_bullet
					image_xscale = other.image_xscale
				}
				break
			case obj_kentukybomber:
				instance_create(x, (y + 70), obj_kentukybomb)
				break
			case obj_bazookabaddie:
				var xx = (x + (72 * image_xscale))
				instance_create(xx, y, obj_bazooka)
				create_particle(xx, y, particle.balloonpop)
				break
		}

	}
	if ((!grounded) && hsp < 0)
		hsp += 0.1
	else if ((!grounded) && hsp > 0)
		hsp -= 0.1
	exit;
}

