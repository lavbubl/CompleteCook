init_collide()

spawn = "a"
door_type = fade_types.none
wasclimbingwall = false
coyote_time = 0
movespeed = 0
state = states.normal
//exitdoor properties
state = states.actor
sprite_index = spr_player_walkfront
image_speed = 0.35
//the end
prevstate = states.normal
xscale = 1
jumpstop = false
mach4mode = false
wallspeed = 0
flash = 0

aftimg_timers = {
	mach: {timer: 0, effect: after_images.mach, resetpoint: 5, do_it: false},
	blur: {timer: 0, effect: after_images.blur, resetpoint: 2, do_it: false}
}

/*ptcl_timers = {
	bleh: 0
} what was this again?*/

dir = 0
freefallsmash = 0
crouchslipbuffer = 0
grabclimbbuffer = 0
ladderbuffer = 0

prev = {
	state: self.state,
	hsp: self.hsp,
	vsp: self.vsp,
	sprite_index: self.sprite_index,
}

breakdance_secret = {
	buffer: 0,
	spd: 0.1
}

loop_sounds = {
	mach1: {state: states.mach2, sound: sfx_mach1, sndid: noone, is_3d: true, func: function() {
		if obj_player.sprite_index != spr_player_mach1
			return true;}
	},
	mach2: {state: states.mach2, sound: sfx_mach2, sndid: noone, is_3d: true, func: function() {
		if obj_player.sprite_index != spr_player_mach2
			return true;}
	},
	mach3: {state: states.mach3, sound: sfx_mach3, sndid: noone, is_3d: true, func: function() {
		if ((obj_player.sprite_index == spr_player_mach3hit && obj_player.image_index < 2) || obj_player.sprite_index == spr_player_crazyrun)
			return true;}
	},
	mach4: {state: states.mach3, sound: sfx_mach4, sndid: noone, is_3d: true, func: function() {
		if obj_player.sprite_index != spr_player_crazyrun
			return true;}
	},
	climbwall: {state: states.climbwall, sound: sfx_mach2, is_3d: true, sndid: noone},
	groundpound: {state: states.groundpound, sound: sfx_groundpoundloop, is_3d: true, sndid: noone},
	piledriver: {state: states.piledriver, sound: sfx_groundpoundloop, sndid: noone, is_3d: true, func: function() {
		if (obj_player.sprite_index == spr_player_piledriverland)
			return true;}
	},
	superjumphold: {state: states.superjump, sound: sfx_superjumphold, sndid: noone, is_3d: true, func: function() {
		if (obj_player.sprite_index == spr_player_superjump || obj_player.sprite_index == spr_player_Sjumpcancelstart)
			return true;}, looppoints: [0.64, 1.84]
	}
}

visual_size = 1
secret_exit = false
secret_cutscene = false
idletimer = 120
instakill = false
taunttimer = 0
i_frames = 0
particle_timer = 0
flamecloud_buffer = 0
haskey = false
hasgerome = false
fallingtimer = 0
depth = -100

pal_select = 1
pattern_spr = pat_pizza

pattern_init()

input_buffers = {
	jump: 0,
	grab: 0
} //fuck it, ill just do it in the player step

return_location = {
	room: 0,
	x: 0,
	y: 0
}

doorxscale = 1
warping = false
hitstun = 0
supertauntcount = 0
supertauntshow = false
supertauntbuffer = 0
myemitter = noone
