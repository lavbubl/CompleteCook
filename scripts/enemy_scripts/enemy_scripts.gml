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
	
	with instance_place(x + hsp + xscale, y + vsp - 1, obj_destroyable)
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
	else if (obj_player.state == states.mach3 || obj_player.sprite_index == spr_player_swingding) && abs(x - obj_player.x) < 400 && abs(y - obj_player.y) < 110 && state != states.hit && collision_line(x, y, obj_player.x, obj_player.y, obj_solid, false, true) == noone
	{
		state = states.scared
		hsp = 0
		if grounded
			vsp = -3
		else 
			vsp = max(vsp, 0)
		movespeed = 0
		xscale = obj_player.x > x ? 1 : -1
		scared_timer = 100
		sprite_index = sprs.scared
		if irandom(100) <= 5
			scr_sound_3d_pitched(choose(sfx_rarescream1, sfx_rarescream2), x, y)
	}
}

function do_enemygibs()
{
	particle_create(x, y, particles.bang)
	particle_create(x, y, particles.parry)
	repeat 3
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
	if state == states.hit
		grav = 0

	if place_meeting(x, y, obj_player)
	{
		if obj_player.instakill && alarm[0] == -1 && !follow_player && obj_player.hitstun <= 0
		{
			with obj_player
			{
				if state == states.mach3
					reset_anim(spr_player_mach3hit)
				if !grounded && input.jump.check && state != states.groundpound
				{
					input_buffers.jump = 0
					vsp = -11
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
		else if (obj_player.state == states.mach2 || obj_player.state == states.tumble || obj_player.state == states.slide) && stun_timer < 165 && obj_player.hitstun <= 0
		{
			hsp = obj_player.xscale * 12
			vsp = (other.y - 180 - y) / 60 //base game ???
			xscale = -obj_player.xscale
			warp = 0.3
			state = states.stun
			stun_timer = 180
			obj_player.hitstun = 1
			obj_player.prev_ix = obj_player.image_index
			particle_create(x, y, particles.bang)
			create_effect(x, y, spr_cloudeffect)
			repeat 4
				particle_create(x, y, particles.stars)
			scr_sound_3d_pitched(sfx_bumpenemy, x, y)
		}
		with obj_player
		{
			if state == states.grab && other.state != states.hit && other.alarm[0] == -1 //alarm == -1 means not hitstunned
			{
				other.follow_player = true
				other.sprite_index = other.sprs.stun
				reset_anim(spr_player_haulingrise)
				state = states.hold
				if abs(hsp) > 10 && other.alarm[0] == -1
				{
					state = states.swingding
					reset_anim(spr_player_swingding)
				}
				
				if !grounded
					vsp = -6
				
				if (input.up.check)
				{
					state = states.piledriver
					dir = xscale
					vsp = -14
					sprite_index = spr_player_piledriver
				}
			}
			if collision_line(bbox_left - 16, bbox_bottom, bbox_right + 16, bbox_bottom, other, false, true) && vsp > 2 && (state == states.jump || state == states.hold)
			{
				if state == states.jump
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
					stun_timer = 100
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
