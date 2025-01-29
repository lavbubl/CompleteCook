function anim_ended()
{
	return image_index + image_speed >= image_number
}

function do_groundpound()
{
	if (key_down.pressed)
	{
		state = states.groundpound
		sprite_index = spr_player_bodyslamstart
		image_index = 0
		vsp = -6
	}
}

function do_grab()
{
	if (key_attack.pressed)
	{
		if (!key_up.down)
		{
			if (movespeed < 6)
				movespeed = 6
			state = states.grab
			reset_anim(spr_player_suplexgrab)
			scr_sound_3d(sfx_suplexdash, x, y)
		}
		else
		{
			vsp = grounded ? -14 : -10
			hsp = abs(hsp) * xscale
			state = states.punch
			reset_anim(spr_player_uppercut)
			image_speed = 0.35
			scr_sound_pitched(sfx_uppercut)
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
			sprite_index: self.sprite_index,
		}
		sprite_index = spr_player_taunt
		image_index = random_range(0, image_number)
		taunttimer = 20
		state = states.taunt
		particle_create(x, y, particles.taunt)
		scr_sound_pitched(sfx_taunt)
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
			if (_data.sndid == -1 && !dont_play)
			{
				_data.sndid = 1
				_data.emitter = emitter_create_quick(_id.x, _id.y, _id)
				var s = scr_sound_3d_on(_data.emitter, _data.sound, true)
				
				if struct_exists(_data, "looppoints")
				{
					audio_sound_loop_start(s, _data.looppoints[0])
					audio_sound_loop_end(s, _data.looppoints[1])
				}
			}
			
			if (_data.sndid != -1 && dont_play)
			{
				if _data.emitter != -1
				{
					audio_emitter_free(_data.emitter)
					_data.emitter = -1
				}
				
				_data.sndid = -1
			}
		}
		else
		{
			if (_id.state == _data.state && !dont_play && _data.sndid == -1)
			{
				_data.sndid = scr_sound(_data.sound, true)
				if struct_exists(_data, "looppoints")
				{
					audio_sound_loop_start(_data.sndid, _data.looppoints[0])
					audio_sound_loop_end(_data.sndid, _data.looppoints[1])
				}
			}
			
			if (_data.sndid != -1 && dont_play)
			{
				audio_stop_sound(_data.sndid)
				_data.sndid = -1
			}
		}
	})
	
	if (state != states.grab)
		audio_stop_sound(sfx_suplexdash)
		
}

function do_hurt()
{
	state = states.hurt
	hsp = -8 * xscale
	vsp = -12
	global.combo.timer -= 30
	i_frames = 100
	scr_sound_pitched(sfx_hurt)
}
