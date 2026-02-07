yscale = 1

if (obj_player.state != states.hold && 
	obj_player.state != states.piledriver && 
	obj_player.state != states.punchenemy &&
	obj_player.state != states.swingding)
	follow_player = false

if (!follow_player && state == states.grabbed)
{
	stun_timer = 180
	state = states.stun
}

switch (object_index)
{
	case obj_forknight:
		if (sprite_index == sprs.move && hurtbox_id == -4)
			create_hurtbox()
		else if (sprite_index != sprs.move && hurtbox_id != -4)
			destroy_hurtbox()
		break;
}

if follow_player
{
	hsp = 0
	vsp = 0
	with (obj_player)
	{
		switch (state)
		{
			case states.hold:
				other.x = x
				other.y = y - 64
				other.xscale = -xscale
				if sprite_index == spr_player_haulingrise
					other.y += floor(image_number - image_index) * 10
				break;
			case states.piledriver:
				other.x = x
				other.y = y
				other.yscale = -1
				break;
			case states.punchenemy:
				var _dist_x = 60
				var _dist_y = 20
				other.x = x
				other.y = y
				with other //dont go into solids
				{
					if !scr_solid(x + (_dist_x * other.xscale), y)
						x += _dist_x * other.xscale
					else
					{
						repeat _dist_x 
						{
							if !scr_solid(x + other.xscale, y)
								x += other.xscale
							else
								break;
						}
					}
					if !scr_solid(x, y - _dist_y)
						y -= _dist_y
					else
					{
						repeat _dist_y
						{
							if !scr_solid(x, y - 1)
								y--
							else
								break;
						}
					}
				}
				break;
			case states.swingding:
				other.x = x
				other.y = y - 20
				break;
		}
		other.state = states.grabbed
		if input.down.check
		{
			if (grounded && state == states.hold)
			{
				state = states.normal
				with other
				{
					follow_player = false
					y = other.y
					state = states.stun
					stun_timer = 180
				}
			}
			if (!grounded && (state == states.hold || state == states.swingding))
			{
				sprite_index = spr_player_piledriver
				movespeed = abs(hsp)
				state = states.piledriver
				vsp = -5
				dir = xscale
				other.yscale = -1
			}
		}
		if (image_index >= image_number - 2 && sprite_index == spr_player_piledriverland)
		{
			with (other)
			{
				do_enemygibs()
				alarm[0] = 1
			}
		}
		
		var ixcheck = 4
		if sprite_index == spr_player_swingdingend
			ixcheck = 1
			
		if state == states.punchenemy && floor(image_index) >= ixcheck && other.state != states.hit
		{
			vsp = -6
			shake_camera(3, 3 / room_speed)
			scr_sound_3d(sfx_punch, x, y)
			scr_sound_3d(sfx_killingblow, x, y)
			with other
			{
				mask_index = mask_player_small
				follow_player = false
				state = states.hit
				hsp = other.xscale * 25
				vsp = 0
				if other.sprite_index == spr_player_uppercutfinishingblow
				{
					hsp = 0
					vsp = -25
				}
				do_enemygibs()
			}
			global.combo.timer = 60
		}
	}
}

var en_list = ds_list_create()
instance_place_list(x, y, par_enemy, en_list, false)

for (var i = 0; i < ds_list_size(en_list); i++) {
    var _id = ds_list_find_value(en_list, i)
	if place_meeting(x, y, _id) && _id.state == states.hit && enemy_can_die()
	{
		instance_destroy()
		scr_sound_3d(sfx_punch, x, y)
	}
}

ds_list_destroy(en_list)

if string_starts_with(sprite_get_name(obj_player.sprite_index), "spr_player_supertaunt") && bbox_in_camera() && enemy_can_die()
{
	if alarm[0] == -1
		do_enemygibs()
	state = states.stun
	stun_timer = 2
	sprite_index = sprs.stun
	alarm[0] = 999
}

if alarm[0] >= 0
{
	hsp = 0
	vsp = 0
}
