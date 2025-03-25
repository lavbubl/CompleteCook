function anim_ended()
{
	return image_index >= image_number - 1;
}

function do_groundpound()
{
	if (key_down.pressed)
	{
		dir = p_move
		state = states.groundpound
		sprite_index = spr_player_bodyslamstart
		image_index = 0
		vsp = -6
	}
}

function do_grab()
{
	if input_buffers.grab > 0
	{
		input_buffers.grab = 0
		if (!key_up.down)
		{
			movespeed = max(movespeed, 5)
			if state == states.normal
				movespeed = 8
			state = states.grab
			reset_anim(spr_player_suplexgrab)
			scr_sound_3d(sfx_suplexdash, x, y)
			particle_create(x, y, particles.genericpoof, xscale, 1, spr_jumpdust)
		}
		else
		{
			vsp = grounded ? -14 : -10
			hsp = abs(hsp) * xscale
			state = states.punch
			reset_anim(spr_player_uppercut)
			image_speed = 0.35
			create_effect(x, y, spr_highjumpcloud2)
			scr_sound_3d_pitched(sfx_uppercut, x, y)
		}
	}
}

function do_taunt()
{
	if (key_taunt.pressed)
	{
		prev = {
			state: self.state,
			hsp: self.hsp,
			vsp: self.vsp,
			sprite_index: self.sprite_index
		}
		
		sprite_index = spr_player_taunt
		image_index = random_range(0, image_number)
		taunttimer = 20
		state = states.taunt
		particle_create(x, y, particles.taunt)
		scr_sound_3d_pitched(sfx_taunt, x, y)
		instance_create(x, y, obj_parrybox)
	}
}

function player_sounds()
{
	struct_foreach(loop_sounds, function(_name, _data)
	{
		var _id = obj_player
		
		var dont_play = false
		
		if _id.state != _data.state
			dont_play = true
			
		if warping
			dont_play = true
		
		if variable_struct_exists(_data, "func")
		{
			if _data.func()
				dont_play = true
		}
		
		var confirmed_3d = false
		
		if (variable_struct_exists(_data, "is_3d"))
			confirmed_3d = _data.is_3d
		
		if confirmed_3d
		{
			if (_data.sndid == noone && !dont_play)
			{
				_data.sndid = 1 //tjhis is a shitty hack :(
				_data.emitter = emitter_create_quick(_id.x, _id.y, _id)
				var s = scr_sound_3d_on(_data.emitter, _data.sound, true)
				
				if struct_exists(_data, "looppoints")
				{
					audio_sound_loop_start(s, _data.looppoints[0])
					audio_sound_loop_end(s, _data.looppoints[1])
				}
			}
			
			if (_data.sndid != noone && dont_play)
			{
				if _data.emitter != noone
				{
					audio_emitter_free(_data.emitter)
					_data.emitter = noone
				}
				
				_data.sndid = noone
			}
		}
		else
		{
			if (_id.state == _data.state && !dont_play && _data.sndid == noone)
			{
				_data.sndid = scr_sound(_data.sound, true)
				if struct_exists(_data, "looppoints")
				{
					audio_sound_loop_start(_data.sndid, _data.looppoints[0])
					audio_sound_loop_end(_data.sndid, _data.looppoints[1])
				}
			}
			else if (_data.sndid != noone && dont_play)
			{
				audio_stop_sound(_data.sndid)
				_data.sndid = noone
			}
		}
	})
	
	if (state != states.grab)
		audio_stop_sound(sfx_suplexdash)
		
}

function decrease_score(val)
{
	var s = global.score - val
	var num = -val
	
	if s < 0
		num += abs(0 - s)
	
	if num < 0
	{
		with instance_create(0, 0, obj_negativenumber)
			number = string(num)
	}
	
	global.score = max(global.score - val, 0)
}

function do_hurt(obj = noone)
{
	if obj != noone
	{
		var xh = lerp(obj.bbox_left, obj.bbox_right, 0.5)
		var goto_xscale = 1
		if x != xh
			goto_xscale = sign(x - xh)
		var facing = xscale == -goto_xscale
		hsp = 8 * goto_xscale
		sprite_index = facing ? spr_player_hurt : spr_player_jumphurt
	}
	else
		sprite_index = spr_player_hurt
	
	flash = 8
	state = states.hurt
	vsp = -12
	global.combo.timer -= 30
	sleep(100)
	decrease_score(50)
	i_frames = 100
	scr_sound_pitched(sfx_hurt, 0.9, 1.1)
	
	particle_create(x, y, particles.parry)
	particle_create(x, y, particles.bang)
	create_effect(x, y, spr_hurtstars)
	
	repeat 5
		particle_create(x, y, particles.hurtstar)
		
	if global.score > 0
	{
		repeat 10
		{
			var spr = choose(
				spr_mushroomcollect, 
				spr_cheesecollect, 
				spr_tomatocollect, 
				spr_sausagecollect, 
				spr_pineapplecollect
			)
			
			with create_debris(x, y, spr)
			{
				hsp = random_range(-10, 10)
				vsp = random_range(-5, 0)
				image_angle = 0
				image_speed = 0.35
			}
		}
	}
	
	with obj_tv
		tv_expression(spr_tv_hurt)
}
