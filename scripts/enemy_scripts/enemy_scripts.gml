function enemy_normal()
{
	var hurtbox_needed = false
	
	if (object_index == obj_forknight) //REPLACE WITH SWITCH STATEMENT
		hurtbox_needed = true
	
	image_speed = 0.35
	
	movespeed = 1
	
	if grounded
	{
		hsp = movespeed * xscale
	
		if (place_meeting(x + xscale, y, obj_solid) || !scr_solid(x + hsp + xscale, y + 4))
		{
			xscale *= -1
			if do_turn
				reset_anim(sprs.turn)
		}
	}
	else
		hsp = 0
		
	if (do_turn && sprite_index == sprs.turn)
	{
		hsp = 0
		if anim_ended()
		{
			reset_anim(sprs.move)
			create_hurtbox()
		}
	}
}

function enemy_scared()
{
	if (scared_timer <= 0 && grounded)
	{
		state = states.normal
		sprite_index = sprs.move
	}
}

function enemy_grabbed()
{
	hsp = 0
	sprite_index = sprs.stun
	image_speed = 0.35
}

function enemy_stun()
{
	if grounded
		hsp = approach(hsp, 0, 0.25)
	sprite_index = sprs.stun
	image_speed = 0.35
	if (stun_timer <= 0 && grounded)
	{
		state = states.normal
		sprite_index = sprs.move
	}
	else
		stun_timer--
}

function enemy_hit()
{
	sprite_index = sprs.dead
	with instance_place(x + hsp, y + vsp, obj_destroyable)
		instance_destroy()
	if (place_meeting(x + hsp, y + vsp, obj_solid) && !place_meeting(x + hsp, y + vsp, obj_destroyable))
	{
		y -= 20
		instance_destroy()
	}
}

function do_scared()
{
	if scared_timer > 0
		scared_timer--
	else if (obj_player.state == states.mach3 && distance_to_object(obj_player) < 200 && state != states.hit && grounded)
	{
		state = states.scared
		hsp = 0
		vsp = -5
		movespeed = 0
		sprite_index = sprs.scared
		xscale = obj_player.x > x ? 1 : -1
		scared_timer = 180
	}
}

function do_enemygibs()
{
	particle_create(x, y, particles.bang)
	particle_create(x, y, particles.parry)
	repeat (3)
	{
		particle_create(x, y, particles.gib)
		with particle_create(x, y, particles.stars)
		{
			hsp = random_range(-5, 5)
			vsp = random_range(-10, 10);
		}
	}
}

function do_enemy_generics()
{
	struct_foreach(state_struct, function(_name, _data)
	{
		var func_todo = _data.func
	
		if (self.state == _data.state)
		{
			with (self)
				func_todo()
		}
	})

	do_scared()

	grav = 0.5
	if (state == states.hit)
		grav = 0

	if (place_meeting(x - obj_player.hsp, y - obj_player.vsp, obj_player))
	{
		if (obj_player.instakill && alarm[0] == -1 && !follow_player)
		{
			with (obj_player)
			{
				if (state == states.mach3)
					reset_anim(spr_player_mach3hit)
				if ((input.jump.check && state != states.groundpound) || state == states.swingding)
				{
					vsp = -10
					jumpstop = false
				}
			}
			
			sprite_index = sprs.stun
			
			shake_camera()
			scr_sound_3d(sfx_punch, x, y)
			create_effect(x, y, spr_kungfueffect).depth = -100
		
			obj_player.hitstun = 5
			obj_player.prev_ix = obj_player.image_index
			alarm[0] = 2
		}
		if ((obj_player.state == states.mach2 || obj_player.state == states.tumble) && stun_timer < 160)
		{
			sleep(50)
			hsp = obj_player.xscale * 18
			xscale = -obj_player.xscale
			warp = 0.4
			state = states.stun
			stun_timer = 180
			vsp = -5
			repeat (4)
				particle_create(x, y, particles.stars)
			flash = 8
		}
		with (obj_player)
		{
			if (state == states.grab && other.sprite_index != other.sprs.dead)
			{
				other.follow_player = true
				other.sprite_index = other.sprs.stun
				reset_anim(spr_player_haulingrise)
				state = states.hold
				if (abs(hsp) > 10 && other.alarm[0] == -1)
				{
					state = states.swingding
					sprite_index = spr_player_swingding
					if !grounded
						vsp = -5
				}
				if (input.up.check)
				{
					state = states.piledriver
					sprite_index = spr_player_piledriver
					vsp = -18
				}
			}
			if (collision_line(bbox_left - 16, y + 20, bbox_right + 16, y + 20, other, false, true) && vsp > 2 && (state == states.jump || state == states.hold))
			{
				if (state == states.jump)
					reset_anim(spr_player_stomp)
				vsp = input.jump.check ? -14 : -9
				jumpstop = true
				
				scr_sound_3d(sfx_stompenemy, x, y)
				with (other)
				{
					xscale = -obj_player.xscale
					hsp = obj_player.xscale * 5
					vsp = -5
					state = states.stun
					stun_timer = 180
					warp = -0.4
				}
			}
		}
	}

	if blur_timer > 0
		blur_timer--
	else if state == states.hit
	{
		with afterimage_create(after_images.blur)
			y -= 20
		blur_timer = 2
	}

	if (obj_player.state == states.taunt)
	{
		scared_timer = 0
		stun_timer = 0
	}

	warp = approach(warp, 0, 0.025)

	if flash > 0
		flash--

	var en_list = ds_list_create()
	instance_place_list(x, y, par_enemy, en_list, false)

	for (var i = 0; i < ds_list_size(en_list); i++) {
	    var _id = ds_list_find_value(en_list, i)
		if place_meeting(x, y, _id)
		{
			if _id.state == states.hit
				instance_destroy()
		}
	}
	
	ds_list_destroy(en_list)
	break_destroyables()
}

function create_hurtbox()
{
	with instance_create(x, y, obj_hurtbox)
	{
		other.hurtbox_id = id
		follow_obj = other.id
	}
}

function destroy_hurtbox()
{
	instance_destroy(hurtbox_id)
	hurtbox_id = -4
}

function enemy_can_die(_id = self)
{
	with _id
		return !escape_frozen; //i feel like thisll be bigger later so its a func
}
