function scr_playerreset()
{
	trace("playerreset")
	global.lap = 0
	global.laps = 0
	global.secretfound = 0
	with (obj_music)
	{
		secret = 0
		music = -4
		secretmusic = -4
	}
	instance_destroy(obj_combotitle)
	instance_destroy(obj_comboend)
	instance_destroy(obj_sandparticle)
	instance_destroy(obj_lap2visual)
	instance_destroy(obj_gravecorpse, false)
	with (obj_camera)
		alarm[4] = -1
	if (!global.levelreset)
	{
		instance_destroy(obj_deliverytimer)
		instance_destroy(obj_wartimer)
		with (obj_cutscene_handler)
			instance_destroy()
		with (obj_snowparticle)
			instance_destroy()
		with (obj_tv)
		{
			shownranka = 0
			shownrankb = 0
			shownrankc = 0
			ds_list_clear(tvprompts_list)
			prompt = ""
			bubblespr = -4
			promptx = promptxstart
			if (!global.levelreset)
			{
				sprite_index = spr_tv_off
				tvsprite = spr_tv_idle
				state = states.normal
				tv_set_idle()
			}
		}
		with (obj_secretmanager)
		{
			ds_list_clear(secrettriggers)
			ds_list_clear(touchall)
			touchrequirement = -4
			init = 0
		}
		ds_list_clear(global.baddieroom)
		ds_list_clear(global.saveroom)
		ds_list_clear(global.escaperoom)
		global.combodropped = 0
		global.timeractive = 0
		global.wave = 0
		global.maxwave = 0
		global.secretfound = 0
		global.hurtcounter = 0
		global.snickchallenge = 0
		global.timeattack = 0
		global.giantkey = 0
		global.pizzadelivery = 0
		global.failcutscene = 0
		global.pizzasdelivered = 0
		global.spaceblockswitch = 1
		global.fill = 500
		global.chunk = 5
		global.hasfarmer = array_create(3, 0)
		global.checkpoint_room = -4
		global.checkpoint_door = "A"
		global.noisejetpack = 0
		global.hp = 0
		global.kungfu = 0
		global.graffiticount = 0
		global.gerome = 0
		global.stylelock = 0
		global.ammorefill = 0
		global.ammoalt = 1
		global.mort = 0
		global.style = 0
		global.spaceblockswitch = 1
		global.stylethreshold = 0
		global.baddiespeed = 1
		global.bullet = 3
		global.fuel = 3
		global.horse = 0
		global.golfhit = 0
		global.railspeed = global.maxrailspeed
		global.temperature = 0
		if (room != freezer_1)
			global.use_temperature = 0
		global.heatmeter_count = 0
		global.monsterspeed = 0
		global.timedgate = 0
		global.timedgatetimer = 0
		global.timedgatetime = 0
		global.taseconds = 0
		global.taminutes = 0
		global.key_inv = 0
		global.pepanimatronic = 0
		global.shroomfollow = 0
		global.cheesefollow = 0
		global.tomatofollow = 0
		global.sausagefollow = 0
		global.pineapplefollow = 0
		global.keyget = 0
		global.collect = 0
		global.collectN = 0
		global.ammo = 0
		global.treasure = 0
		global.combo = 0
		global.combotime = 0
		global.heattime = 0
		global.pizzacoin = 0
		global.toppintotal = 1
		global.hit = 0
		global.playerhealth = 9
		global.panic = false
		global.level_minutes = 0
		global.level_seconds = 0
		with (obj_stylebar)
			sprite = spr_mild
		with (obj_music)
			arena = 0
		if instance_exists(obj_endlevelfade)
			instance_destroy(obj_endlevelfade)
		if instance_exists(obj_monstertrackingrooms)
			instance_destroy(obj_monstertrackingrooms)
		instance_destroy(obj_trapghost)
		instance_destroy(obj_comboend)
		instance_destroy(obj_farmer1follow)
		instance_destroy(obj_farmer2follow)
		instance_destroy(obj_farmer3follow)
		if instance_exists(obj_snickexe)
			instance_destroy(obj_snickexe)
		if instance_exists(obj_pizzaface)
			instance_destroy(obj_pizzaface)
		if instance_exists(obj_pizzashield)
			instance_destroy(obj_pizzashield)
		instance_destroy(obj_pepanimatronicfollow)
		if instance_exists(obj_coopflag)
			instance_destroy(obj_coopflag)
		if instance_exists(obj_cooppointer)
			instance_destroy(obj_cooppointer)
		instance_destroy(obj_coopplayerfollow)
		if instance_exists(obj_toppinwarrior)
			instance_destroy(obj_toppinwarrior)
		if instance_exists(obj_timesup)
			instance_destroy(obj_timesup)
	}
	with (obj_player)
	{
		ratpowerup = -4
		scale_xs = 1
		scale_ys = 1
		obj_camera.targetgolf = -4
		ds_list_clear(global.baddietomb)
		obj_player.supercharge = 0
		obj_player.supercharged = 0
		pistol = 0
		if instance_exists(obj_gnome_checklist)
		{
			var destroy = 1
			with (obj_player)
			{
				if (state == states.gameover or state == states.timesup)
					destroy = 0
			}
			if destroy
				instance_destroy(obj_gnome_checklist)
		}
		obj_timeattack.stop = 0
		obj_player1.spotlight = 1
		obj_player2.x = -1000
		obj_player2.y = 500
		global.SAGEshotgunsnicknumber = 0
		obj_music.fadeoff = 0
		audio_stop_all()
		global.seconds = 59
		global.minutes = 1
		obj_player1.state = states.comingoutdoor
		obj_player2.state = states.comingoutdoor
		obj_player1.visible = true
		obj_player2.visible = true
		ds_list_clear(global.saveroom)
		ds_list_clear(global.escaperoom)
		ds_list_clear(global.baddieroom)
		with (obj_player)
		{
			ds_list_clear(hitlist)
			image_blend = make_colour_hsv(0, 0, 255)
			boxxed = 0
			boxxeddash = 0
			supercharged = 0
			pizzapepper = 0
			pizzashield = 0
			c = 0
			heavy = 0
			image_index = 0
			sprite_index = spr_walkfront
			alarm[0] = -1
			alarm[1] = -1
			alarm[3] = -1
			alarm[4] = -1
			alarm[5] = -1
			alarm[6] = -1
			alarm[7] = -1
			alarm[8] = -1
			alarm[9] = -1
			alarm[10] = -1
			grav = 0.5
			hsp = 0
			vsp = 0
			xscale = 1
			yscale = 1
			parry = 0
			parry_inst = -4
			parry_count = 0
			is_firing = 0
			pogospeed = 6
			pogochargeactive = 0
			pogocharge = 100
			x = backtohubstartx
			y = backtohubstarty
			roomstartx = x
			roomstarty = y
			backupweapon = 0
			shotgunAnim = 0
			box = 0
			steppy = 0
			movespeedmax = 5
			jumpstop = 0
			start_running = 1
			obj_camera.ded = 0
			visible = true
			turn = 0
			jumpAnim = 1
			dashAnim = 1
			landAnim = 0
			machslideAnim = 0
			moveAnim = 1
			stopAnim = 1
			crouchslideAnim = 1
			crouchAnim = 1
			machhitAnim = 0
			stompAnim = 0
			inv_frames = 0
			turning = 0
			hurtbounce = 0
			hurted = 0
			autodash = 0
			mach2 = 0
			input_buffer_jump = 8
			input_buffer_secondjump = 8
			input_buffer_highjump = 8
			flash = 0
			in_water = 0
			key_particles = 0
			barrel = 0
			bounce = 0
			a = 0
			idle = 0
			attacking = 0
			slamming = 0
			superslam = 0
			machpunchAnim = 0
			punch = 0
			machfreefall = 0
			shoot = 0
			instakillmove = 0
			windingAnim = 0
			facestompAnim = 0
			ladderbuffer = 0
			chainsaw = 50
			toomuchalarm1 = 0
			toomuchalarm2 = 0
			dashdust = 0
			throwforce = 0
			hurtsound = 0
			idleanim = 0
			momemtum = 0
			cutscene = 0
			grabbing = 0
			dir = xscale
			goingdownslope = 0
			goingupslope = 0
			fallinganimation = 0
			bombpeptimer = 100
			slapbuffer = 0
			slaphand = 1
			suplexmove = 0
			suplexhavetomash = 0
			timeuntilhpback = 300
			anger = 0
			angry = 0
			skateboarding = 0
			brick = 0
			isgustavo = 0
			controllableSjump = 0
		}
	}
	with (obj_player2)
	{
		pizzashield = 0
		image_blend = make_colour_hsv(0, 0, 255)
		supercharged = 0
		pizzapepper = 0
		c = 0
		heavy = 0
		image_index = 0
		sprite_index = spr_walkfront
		alarm[0] = -1
		alarm[1] = -1
		alarm[3] = -1
		alarm[4] = -1
		alarm[5] = -1
		alarm[6] = -1
		alarm[7] = -1
		alarm[8] = -1
		alarm[9] = -1
		alarm[10] = -1
		grav = 0.5
		hsp = 0
		vsp = 0
		global.playerhealth = 9
		xscale = 1
		yscale = 1
		pogospeed = 6
		pogochargeactive = 0
		pogocharge = 100
		parry = 0
		parry_inst = -4
		parry_count = 0
		is_firing = 0
		x = backtohubstartx
		y = backtohubstarty
		backupweapon = 0
		shotgunAnim = 0
		box = 0
		steppy = 0
		movespeedmax = 5
		jumpstop = 0
		start_running = 1
		obj_camera.ded = 0
		visible = true
		global.panic = false
		turn = 0
		jumpAnim = 1
		dashAnim = 1
		landAnim = 0
		machslideAnim = 0
		moveAnim = 1
		stopAnim = 1
		crouchslideAnim = 1
		crouchAnim = 1
		machhitAnim = 0
		stompAnim = 0
		inv_frames = 0
		turning = 0
		hurtbounce = 0
		hurted = 0
		autodash = 0
		mach2 = 0
		input_buffer_jump = 8
		input_buffer_secondjump = 8
		input_buffer_highjump = 8
		flash = 0
		global.key_inv = 0
		global.shroomfollow = 0
		global.cheesefollow = 0
		global.tomatofollow = 0
		global.sausagefollow = 0
		global.pineapplefollow = 0
		global.keyget = 0
		global.collect = 0
		global.collectN = 0
		global.ammo = 0
		global.treasure = 0
		global.savedcombo = 0
		global.comboscore = 0
		global.combo = 0
		global.highest_combo = 0
		global.player_damage = 0
		global.tauntcount = 0
		global.combotime = 0
		global.heattime = 0
		global.pizzacoin = 0
		global.toppintotal = 1
		global.hit = 0
		in_water = 0
		key_particles = 0
		barrel = 0
		bounce = 0
		a = 0
		idle = 0
		attacking = 0
		slamming = 0
		superslam = 0
		machpunchAnim = 0
		punch = 0
		machfreefall = 0
		shoot = 0
		instakillmove = 0
		windingAnim = 0
		facestompAnim = 0
		ladderbuffer = 0
		chainsaw = 50
		toomuchalarm1 = 0
		toomuchalarm2 = 0
		dashdust = 0
		throwforce = 0
		hurtsound = 0
		idleanim = 0
		momemtum = 0
		cutscene = 0
		grabbing = 0
		dir = xscale
		goingdownslope = 0
		goingupslope = 0
		fallinganimation = 0
		bombpeptimer = 100
		slapbuffer = 0
		slaphand = 1
		suplexmove = 0
		suplexhavetomash = 0
		timeuntilhpback = 300
		anger = 0
		angry = 0
	}
	instance_destroy(obj_followcharacter)
	instance_destroy(obj_shotgunback)
	exit;
}

