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
if (state == e_states.hit)
	grav = 0

collide()

if (place_meeting(x, y, obj_player))
{
	if (obj_player.instakill && alarm[0] == -1 && !follow_player)
	{
		with (obj_player)
		{
			if (state == states.mach3)
				reset_anim(spr_player_mach3kill)
			if ((key_jump.down && state != states.groundpound) || state == states.swingding)
			{
				vsp = -10
				jumpstop = false
			}
		}
		
		sprite_index = sprs.dead
		
		do_enemygibs()
		particle_create(x, y, particles.genericpoof)
		shake_camera()
		
		alarm[0] = 1
	}
	if ((obj_player.state == states.mach2 || obj_player.state == states.tumble) && stun_timer < 160)
	{
		sleep(50)
		hsp = obj_player.xscale * 18
		xscale = -obj_player.xscale
		warp = 0.4
		state = e_states.stun
		stun_timer = 180
		vsp = -5
		repeat (4)
			particle_create(x, y, particles.stars)
		flash = 8
		global.combo.timer = 60
	}
	with (obj_player)
	{
		if (state == states.grab && other.sprite_index != other.sprs.dead)
		{
			other.follow_player = true
			reset_anim(spr_player_holdrise)
			state = states.hold
			if (abs(hsp) > 10)
			{
				state = states.swingding
				sprite_index = spr_player_swingding
				if !grounded
					vsp = -5
			}
			if (key_up.down)
			{
				state = states.piledriver
				sprite_index = spr_player_piledriver
				vsp = -18
			}
		}
		if (collision_line(bbox_left - 16, y + 20, bbox_right + 16, y + 20, other, false, true) && vsp > 2)
		{
			if (state == states.jump)
			{
				vsp = key_jump.down ? -15 : -10
				jumpstop = true
				reset_anim(spr_player_stomp)
				with (other)
				{
					xscale = -obj_player.xscale
					hsp = obj_player.xscale * 5
					vsp = -5
					state = e_states.stun
					stun_timer = 180
					warp = -0.4
				}
			}
			if (state == states.hold)
			{
				vsp = key_jump.down ? -15 : -10
				jumpstop = true
				with (other)
				{
					xscale = -obj_player.xscale
					hsp = obj_player.xscale * 5
					vsp = -5
					state = e_states.stun
					stun_timer = 180
					warp = -0.4
				}
			}
		}
	}
}

if blur_timer > 0
	blur_timer--
else if state == e_states.hit
{
	afterimage_create(after_images.blur)
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
	if (place_meeting(x, y, _id) && _id.state == e_states.hit)
	{
		instance_destroy()
		do_enemygibs()
	}
}
