function anim_ended(_img_index = image_index, _img_number = image_number)
{
	return _img_index >= _img_number - 1;
}

function do_groundpound()
{
	if input.down.pressed || input.groundpound.pressed
	{
		freefallsmash = -14
		dir = p_move
		state = states.groundpound
		if !has_shotgun
		{
			reset_anim(spr_player_bodyslamstart)
			vsp = -6
		}
		else
		{
			fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/killingblow", x, y)
			scr_sound_3d(sfx_shotgunshot, x, y)
			reset_anim(spr_player_shotgun_shootdown)
			vsp = -11
			with instance_create(x, y, obj_shotgunblast)
                sprite_index = spr_shotgunblast_down
		}
	}
}

function do_grab()
{
	if input_buffers.grab > 0
	{
		input_buffers.grab = 0
		if has_shotgun
		{
			fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/kill", x, y)
			scr_sound_3d(sfx_shotgunshot, x, y)
			with create_effect(x, y, spr_guneffect)
			    image_xscale = other.xscale
			state = states.shotgunshoot
			if grounded
			    movespeed = 0
			reset_anim(spr_player_shotgun_shoot)
			with instance_create(x + xscale * 46, (y + 6), obj_shotgunblast)
				image_xscale = other.xscale
		}
		else if (!input.up.check)
		{
			movespeed = max(movespeed, 5)
			if state == states.normal
				movespeed = 8
			state = states.grab
			reset_anim(spr_player_suplexdash)
			fmod_studio_event_instance_start(grab_snd)
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
			fmod_studio_event_instance_oneshot_3d("event:/sfx/player/uppercut", x, y)
		}
	}
}

function do_taunt()
{
	if input.taunt.pressed
	{
		prev = {
			state: self.state,
			hsp: self.hsp,
			vsp: self.vsp,
			sprite_index: self.sprite_index
		}
		
		particle_create(x, y, particles.taunt).image_xscale = xscale
		state = states.taunt
		
		if !(input.up.check && supertauntshow)
		{
			sprite_index = spr_player_taunt
			image_index = random_range(0, image_number)
			taunttimer = 20
			fmod_studio_event_instance_oneshot_3d("event:/sfx/player/taunt", x, y)
			instance_create(x, y, obj_parrybox)
			
			if (place_meeting(x, y, obj_exitgate) && global.panic.active && global.combo.timer > 0 && global.level_data.tauntcount <= 10)
			{
				var t_val = 25
				global.score += t_val
				
				var c = {
					sprite_index: spr_taunteffect,
					image_index: 3,
					x: self.x - obj_camera.campos.x,
					y: self.y - obj_camera.campos.y,
					val: t_val
				}
				
				global.level_data.tauntcount++
				
				array_push(obj_collect_got_visual.collects, c)
				fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/collect", x, y)
				
				with instance_create(x, y, obj_collect_number)
					num = t_val
			}
		}
		else
		{
			taunttimer = 20
			fmod_studio_event_instance_oneshot_3d("event:/sfx/player/supertaunt", x, y)
			reset_anim(asset_get_index($"spr_player_supertaunt{irandom_range(1, 4)}"))
			var spds = [[0, -1], [1, -1], [1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0], [-1, -1]]
			var i = 0
			var spd = 20
			repeat 8
			{
				with particle_create(x, y, particles.sparks)
				{
					hsp = spds[i][0] * spd
					vsp = spds[i][1] * spd
				}
				i++
			}
		}
	}
}

function player_sounds()
{	
	my_3d_attributes.position.x = x
	my_3d_attributes.position.y = y
	
	struct_foreach(loop_sounds, function(_name, _data)
	{
		var _id = obj_player
		
		var do_play = true
		
		if _data.func != noone
			do_play = _data.func()
		
		if (_id.state != _data.state) || _id.warping || hitstun > 0
			do_play = false
		
		if do_play && _data.sndid == noone
		{	
			
			var _event_ref = fmod_studio_system_get_event(_data.sound) //string path
			_data.sndid = fmod_studio_event_description_create_instance(_event_ref)
			fmod_studio_event_instance_start(_data.sndid)
			fmod_studio_event_instance_release(_data.sndid)
		}
		
		if _data.is_3d && _data.sndid != noone && fmod_studio_event_instance_is_valid(_data.sndid)
			fmod_studio_event_instance_set_3d_attributes(_data.sndid, _id.my_3d_attributes)
		
		if (_data.sndid != noone && !do_play)
		{
			fmod_studio_event_instance_stop(_data.sndid, FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT)
			_data.sndid = noone
		}
		
	})
	
	if state != states.grab
		fmod_studio_event_instance_stop(grab_snd, FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT)
	
	#region mach
	
	var _mach_states_arr = [states.mach2, states.mach3, states.climbwall]
	
	if array_contains(_mach_states_arr, state) && !(state == states.mach2 && (!grounded || sprite_index == spr_player_rollgetup)) && hitstun < 0
	{
		if fmod_studio_event_instance_get_playback_state(mach_snd) != FMOD_STUDIO_PLAYBACK_STATE.PLAYING && fmod_studio_event_instance_get_playback_state(mach_snd) != FMOD_STUDIO_PLAYBACK_STATE.STARTING
			fmod_studio_event_instance_start(mach_snd)
		
		var _mach_ix = 1
		
		if sprite_index == spr_player_crazyrun
			_mach_ix = 3
		else if state == states.mach3
			_mach_ix = 2
		else if sprite_index == spr_player_mach1
			_mach_ix = 0
		
		fmod_studio_event_instance_set_parameter_by_name(mach_snd, "mach", _mach_ix)
	}
	else if fmod_studio_event_instance_get_playback_state(mach_snd) != FMOD_STUDIO_PLAYBACK_STATE.STOPPED
		fmod_studio_event_instance_stop(mach_snd, FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT)
	
	#endregion
	
	var _arr_len = array_length(followingsnds)
	
	for (var i = 0; i < _arr_len; i++)
	{
	    var _cur_snd = followingsnds[i]
		fmod_studio_event_instance_set_3d_attributes(_cur_snd, my_3d_attributes)
	}
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
	if state == states.defeat || state == states.actor || state == states.slip
		return;
	
	sleep(100)
	
	if obj != noone
	{
		var xh = lerp(obj.bbox_left, obj.bbox_right, 0.5)
		var goto_xscale = 1
		if x != xh
			goto_xscale = sign(x - xh)
		var facing = xscale == -goto_xscale
		hsp = 8 * goto_xscale
		sprite_index = facing ? spr_player_hurt : spr_player_hurtbehind
		
		if (obj.object_index == obj_outlet || obj.object_index == obj_pizzardelectricity)
			fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/electricity", x, y)
	}
	else
		sprite_index = spr_player_hurt
	
	flash = 8
	state = states.hurt
	vsp = -12
	i_frames = 100
	
	fmod_studio_event_instance_oneshot_3d("event:/sfx/player/hurt", x, y)
	if irandom(100) >= 50
		fmod_studio_event_instance_oneshot_3d("event:/sfx/voice/player/hurt", x, y)
	
	particle_create(x, y, particles.parry)
	particle_create(x, y, particles.bang)
	create_effect(x, y, spr_hurtstars)
	
	global.hurtcounter++
	
	repeat 5
		particle_create(x, y, particles.hurtstar)
		
	if !global.boss_room
	{
		global.combo.timer -= 30
		decrease_score(50)
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
		
		if global.hurtcounter % 10 == 0
		{
			var _name = "Peppino"
			with obj_tv
				tv_expression(asset_get_index($"spr_tv_bighurt{irandom_range(1, 10)}"))
			do_tip($"\{s}You've hurt {_name} {global.hurtcounter} Times...")
		}
		else
		{
			with obj_tv
				tv_expression(spr_tv_hurt)
		}
	}
	else
	{
		if instance_exists(obj_bosscontroller)
		{
			with obj_bosscontroller.player
			{
				with instance_create(hphudpos.x, hphudpos.y, obj_hudhpdebris)
				{
					image_index = other.hpix
					dopalette = true
				}
				hp--
			}
		}
	}
}

function scr_hitwall(_x, _y)
{
	return place_meeting(_x, _y, obj_solid) || behind_collision(_x, _y, obj_slope) || behind_collision(_x, _y, obj_sideplatform)
}

function scr_can_enter_door(_state)
{
	return _state != states.taunt && 
		   _state != states.tumble && 
		   _state != states.ball && 
		   _state != states.fireass && 
		   _state != states.actor && 
		   _state != states.bump;
}

function scr_can_uncrouch()
{
	var prevmask = mask_index
	mask_index = mask_player
	var r = !scr_solid(x, y - 1)
	mask_index = prevmask
	return r;
}
