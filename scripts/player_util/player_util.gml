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
			scr_sound_3d(sfx_killingblow, x, y)
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
			scr_sound_3d(sfx_killenemy, x, y)
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
			scr_sound_3d_on(myemitter, sfx_suplexdash)
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
			scr_sound_3d_pitched(sfx_taunt, x, y, 0.94, 1.06)
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
				scr_sound_multiple(sfx_collect)
				
				with instance_create(x, y, obj_collect_number)
					num = t_val
			}
		}
		else
		{
			taunttimer = 20
			scr_sound_3d(sfx_supertaunt, x, y)
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
	struct_foreach(loop_sounds, function(_name, _data)
	{
		var _id = obj_player
		
		var do_play = true
		
		if _data.func != noone
			do_play = _data.func()
		
		if (_id.state != _data.state) || warping || hitstun > 0
			do_play = false
			
		if _data.is_3d
		{
			if (_data.sndid == noone && do_play && _id.myemitter != noone)
			{
				_data.sndid = scr_sound_3d_on(_id.myemitter, _data.sound, true)
				
				if _data.looppoints != noone
				{
					audio_sound_loop_start(_data.sndid, _data.looppoints[0])
					audio_sound_loop_end(_data.sndid, _data.looppoints[1])
				}
			}
			else if (_data.sndid != noone && !do_play)
			{
				audio_stop_sound(_data.sndid)
				_data.sndid = noone
			}
		}
		else
		{
			if (_id.state == _data.state && do_play && _data.sndid == noone)
			{
				_data.sndid = scr_sound(_data.sound, true)
				if struct_exists(_data, "looppoints")
				{
					audio_sound_loop_start(_data.sndid, _data.looppoints[0])
					audio_sound_loop_end(_data.sndid, _data.looppoints[1])
				}
			}
			else if (_data.sndid != noone && !do_play)
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
			scr_sound_3d(sfx_electricity, x, y)
	}
	else
		sprite_index = spr_player_hurt
	
	flash = 8
	state = states.hurt
	vsp = -12
	i_frames = 100
	
	scr_sound_pitched(sfx_hurt, 0.9, 1.1)
	if irandom(100) >= 50
		scr_sound_pitched(choose(v_pep_hurt, v_pep_hurt2), 0.7, 1.3)
	
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
			obj_shakytext.str = $"\{s}You've hurt {_name} {global.hurtcounter} Times..."
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
