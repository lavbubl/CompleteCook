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
			reset_anim(variable_instance_get(self, $"spr_player_supertaunt{irandom_range(1, 4)}"))
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
		
		if (_id.state != _data.state) || _id.warping || hitstun > 0
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

//function for getting a sprite with the same name with a different character letter, make sure to name your sprites right!
function asset_player_get(_action, _letter, _prefix = "spr_player")
{
	var _asset = asset_get_index(_prefix + _letter + "_" + _action)
	if _asset != -1
		return _asset;
	else
	{
		_asset = asset_get_index(_prefix + "P_" + _action) //peppino is the default
		if _asset != -1 //if its STILL invalid return a blank sprite
			return _asset;
		else
			return spr_null;
	}
}

function sprite_player_reset(_letter)
{
	spr_player_idle = asset_player_get("idle", _letter)
	spr_player_idle1 = asset_player_get("idle1", _letter)
	spr_player_idle2 = asset_player_get("idle2", _letter)
	spr_player_idle3 = asset_player_get("idle3", _letter)
	spr_player_idle4 = asset_player_get("idle4", _letter)
	spr_player_idle5 = asset_player_get("idle5", _letter)
	spr_player_idle6 = asset_player_get("idle6", _letter)
	spr_player_madidle = asset_player_get("madidle", _letter)
	spr_player_rageidle = asset_player_get("rageidle", _letter)
	spr_player_move = asset_player_get("move", _letter)
	spr_player_madmove = asset_player_get("madmove", _letter)
	spr_player_ragemove = asset_player_get("ragemove", _letter)
	spr_player_backslide = asset_player_get("backslide", _letter)
	spr_player_ball = asset_player_get("ball", _letter)
	spr_player_ballend = asset_player_get("ballend", _letter)
	spr_player_bodyslamfall = asset_player_get("bodyslamfall", _letter)
	spr_player_bodyslamstart = asset_player_get("bodyslamstart", _letter)
	spr_player_bodyslamland = asset_player_get("bodyslamland", _letter)
	spr_player_bossdefeated = asset_player_get("bossdefeated", _letter)
	spr_player_breakdance = asset_player_get("breakdance", _letter)
	spr_player_bump = asset_player_get("bump", _letter)
	spr_player_ceilinghit = asset_player_get("ceilinghit", _letter)
	spr_player_climbwall = asset_player_get("climbwall", _letter)
	spr_player_clingwall = asset_player_get("clingwall", _letter)
	spr_player_crawl = asset_player_get("crawl", _letter)
	spr_player_crazyrun = asset_player_get("crazyrun", _letter)
	spr_player_crouch = asset_player_get("crouch", _letter)
	spr_player_crouchdown = asset_player_get("crouchdown", _letter)
	spr_player_crouchfall = asset_player_get("crouchfall", _letter)
	spr_player_crouchslip = asset_player_get("crouchslip", _letter)
	spr_player_dashpad = asset_player_get("dashpad", _letter)
	spr_player_dead = asset_player_get("dead", _letter)
	spr_player_defeat = asset_player_get("defeat", _letter)
	spr_player_defeatland = asset_player_get("defeatland", _letter)
	spr_player_dive = asset_player_get("dive", _letter)
	spr_player_downpizzabox = asset_player_get("downpizzabox", _letter)
	spr_player_entergate = asset_player_get("entergate", _letter)
	spr_player_enterkeydoor = asset_player_get("enterkeydoor", _letter)
	spr_player_facehurt = asset_player_get("facehurt", _letter)
	spr_player_fall = asset_player_get("fall", _letter)
	spr_player_fallface = asset_player_get("fallface", _letter)
	spr_player_finishingblow1 = asset_player_get("finishingblow1", _letter)
	spr_player_finishingblow2 = asset_player_get("finishingblow2", _letter)
	spr_player_finishingblow3 = asset_player_get("finishingblow3", _letter)
	spr_player_finishingblow4 = asset_player_get("finishingblow4", _letter)
	spr_player_finishingblow5 = asset_player_get("finishingblow5", _letter)
	spr_player_fireass = asset_player_get("fireass", _letter)
	spr_player_fireassground = asset_player_get("fireassground", _letter)
	spr_player_freefall = asset_player_get("freefall", _letter)
	spr_player_freefallland = asset_player_get("freefallland", _letter)
	spr_player_gottreasure = asset_player_get("gottreasure", _letter)
	spr_player_grind = asset_player_get("grind", _letter)
	spr_player_haulingfall = asset_player_get("haulingfall", _letter)
	spr_player_haulingidle = asset_player_get("haulingidle", _letter)
	spr_player_haulingjump = asset_player_get("haulingjump", _letter)
	spr_player_haulingland = asset_player_get("haulingland", _letter)
	spr_player_haulingmove = asset_player_get("haulingmove", _letter)
	spr_player_haulingrise = asset_player_get("haulingrise", _letter)
	spr_player_hurt = asset_player_get("hurt", _letter)
	spr_player_hurtbehind = asset_player_get("hurtbehind", _letter)
	spr_player_hurtidle = asset_player_get("hurtidle", _letter)
	spr_player_hurtjump = asset_player_get("hurtjump", _letter)
	spr_player_hurtmove = asset_player_get("hurtmove", _letter)
	spr_player_jump = asset_player_get("jump", _letter)
	spr_player_keyget = asset_player_get("keyget", _letter)
	spr_player_kungfu1 = asset_player_get("kungfu1", _letter)
	spr_player_kungfu2 = asset_player_get("kungfu2", _letter)
	spr_player_kungfu3 = asset_player_get("kungfu3", _letter)
	spr_player_ladder = asset_player_get("ladder", _letter)
	spr_player_ladderdown = asset_player_get("ladderdown", _letter)
	spr_player_laddermove = asset_player_get("laddermove", _letter)
	spr_player_land = asset_player_get("land", _letter)
	spr_player_landmove = asset_player_get("landmove", _letter)
	spr_player_longjump = asset_player_get("longjump", _letter)
	spr_player_lookdoor = asset_player_get("lookdoor", _letter)
	spr_player_lungehit = asset_player_get("lungehit", _letter)
	spr_player_mach1 = asset_player_get("mach1", _letter)
	spr_player_mach2 = asset_player_get("mach2", _letter)
	spr_player_mach2jump = asset_player_get("mach2jump", _letter)
	spr_player_mach3 = asset_player_get("mach3", _letter)
	spr_player_mach3hit = asset_player_get("mach3hit", _letter)
	spr_player_mach3hitwall = asset_player_get("mach3hitwall", _letter)
	spr_player_mach3jump = asset_player_get("mach3jump", _letter)
	spr_player_machfreefall = asset_player_get("machfreefall", _letter)
	spr_player_machroll = asset_player_get("machroll", _letter)
	spr_player_machslideboost = asset_player_get("machslideboost", _letter)
	spr_player_machslideboost3 = asset_player_get("machslideboost3", _letter)
	spr_player_machslideboost3fall = asset_player_get("machslideboost3fall", _letter)
	spr_player_machslideboostfall = asset_player_get("machslideboostfall", _letter)
	spr_player_machslideend = asset_player_get("machslideend", _letter)
	spr_player_machslidestart = asset_player_get("machslidestart", _letter)
	spr_player_panic = asset_player_get("panic", _letter)
	spr_player_parry1 = asset_player_get("parry1", _letter)
	spr_player_parry2 = asset_player_get("parry2", _letter)
	spr_player_parry3 = asset_player_get("parry3", _letter)
	spr_player_piledriver = asset_player_get("piledriver", _letter)
	spr_player_piledriverjump = asset_player_get("piledriverjump", _letter)
	spr_player_piledriverland = asset_player_get("piledriverland", _letter)
	spr_player_poundcancel1 = asset_player_get("poundcancel1", _letter)
	spr_player_poundcancel2 = asset_player_get("poundcancel2", _letter)
	spr_player_presentboxspring = asset_player_get("presentboxspring", _letter)
	spr_player_rockethitwall = asset_player_get("rockethitwall", _letter)
	spr_player_rollgetup = asset_player_get("rollgetup", _letter)
	spr_player_scared = asset_player_get("scared", _letter)
	spr_player_secondjump = asset_player_get("secondjump", _letter)
	spr_player_secondjumploop = asset_player_get("secondjumploop", _letter)
	spr_player_shotgun_crouch = asset_player_get("shotgun_crouch", _letter)
	spr_player_shotgun_crouchfall = asset_player_get("shotgun_crouchfall", _letter)
	spr_player_shotgun_crouchmove = asset_player_get("shotgun_crouchmove", _letter)
	spr_player_shotgun_crouchstart = asset_player_get("shotgun_crouchstart", _letter)
	spr_player_shotgun_fall = asset_player_get("shotgun_fall", _letter)
	spr_player_shotgun_idle = asset_player_get("shotgun_idle", _letter)
	spr_player_shotgun_jump = asset_player_get("shotgun_jump", _letter)
	spr_player_shotgun_land = asset_player_get("shotgun_land", _letter)
	spr_player_shotgun_move = asset_player_get("shotgun_move", _letter)
	spr_player_shotgun_pickup = asset_player_get("shotgun_pickup", _letter)
	spr_player_shotgun_shoot = asset_player_get("shotgun_shoot", _letter)
	spr_player_shotgun_shootdown = asset_player_get("shotgun_shootdown", _letter)
	spr_player_shotgun_shootdownland = asset_player_get("shotgun_shootdownland", _letter)
	spr_player_Sjumpcancel = asset_player_get("Sjumpcancel", _letter)
	spr_player_Sjumpcancelstart = asset_player_get("Sjumpcancelstart", _letter)
	spr_player_slipbanana1 = asset_player_get("slipbanana1", _letter)
	spr_player_slipbanana2 = asset_player_get("slipbanana2", _letter)
	spr_player_stomp = asset_player_get("stomp", _letter)
	spr_player_superjump = asset_player_get("superjump", _letter)
	spr_player_superjumpflash = asset_player_get("superjumpflash", _letter)
	spr_player_superjumpmove = asset_player_get("superjumpmove", _letter)
	spr_player_superjumpprep = asset_player_get("superjumpprep", _letter)
	spr_player_supertaunt1 = asset_player_get("supertaunt1", _letter)
	spr_player_supertaunt2 = asset_player_get("supertaunt2", _letter)
	spr_player_supertaunt3 = asset_player_get("supertaunt3", _letter)
	spr_player_supertaunt4 = asset_player_get("supertaunt4", _letter)
	spr_player_suplexbump = asset_player_get("suplexbump", _letter)
	spr_player_suplexcancel = asset_player_get("suplexcancel", _letter)
	spr_player_suplexdash = asset_player_get("suplexdash", _letter)
	spr_player_suplexgrabjump = asset_player_get("suplexgrabjump", _letter)
	spr_player_swingding = asset_player_get("swingding", _letter)
	spr_player_swingdingend = asset_player_get("swingdingend", _letter)
	spr_player_taunt = asset_player_get("taunt", _letter)
	spr_player_timesup = asset_player_get("timesup", _letter)
	spr_player_uppercut = asset_player_get("uppercut", _letter)
	spr_player_uppercutfinishingblow = asset_player_get("uppercutfinishingblow", _letter)
	spr_player_uppizzabox = asset_player_get("uppizzabox", _letter)
	spr_player_walkfront = asset_player_get("walkfront", _letter)
	spr_player_walljumpend = asset_player_get("walljumpend", _letter)
	spr_player_walljumpstart = asset_player_get("walljumpstart", _letter)
	spr_player_wallsplat = asset_player_get("wallsplat", _letter)
	spr_player_winding = asset_player_get("winding", _letter)
}
