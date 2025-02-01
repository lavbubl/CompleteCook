init_collide()

enum states 
{
	normal,
	jump,
	mach2,
	mach3,
	tumble,
	climbwall,
	slide,
	bump,
	groundpound,
	grab,
	superjump,
	taunt,
	crouch,
	actor,
	ladder,
	punch,
	hold,
	piledriver,
	punchenemy,
	swingding,
	grind,
	hurt,
	parry,
	noclip
}

spawn = "a"
door_type = fade_types.none
hallxscale = 1
hallyscale = 1
wasclimbingwall = false
coyote_time = 0
movespeed = 0
state = states.normal
//exitdoor properties
state = states.actor
sprite_index = spr_player_exitdoor
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

ptcl_timers = {
	bleh: 0
}

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
	mach1: {state: states.mach2, sound: sfx_mach1, sndid: -1, is_3d: true, func: function() {
		if obj_player.sprite_index != spr_player_mach1
			return true;}
	},
	mach2: {state: states.mach2, sound: sfx_mach2, sndid: -1, is_3d: false, func: function() {
		if obj_player.sprite_index != spr_player_mach2
			return true;}
	},
	mach3: {state: states.mach3, sound: sfx_mach3, sndid: -1, is_3d: true, func: function() {
		if ((obj_player.sprite_index == spr_player_mach3kill && obj_player.image_index < 2) || obj_player.sprite_index == spr_player_mach4)
			return true;}
	},
	mach4: {state: states.mach3, sound: sfx_mach4, sndid: -1, is_3d: true, func: function() {
		if obj_player.sprite_index != spr_player_mach4
			return true;}
	},
	climbwall: {state: states.climbwall, sound: sfx_mach2, is_3d: true, sndid: -1},
	groundpound: {state: states.groundpound, sound: sfx_groundpoundloop, is_3d: true, sndid: -1},
	piledriver: {state: states.piledriver, sound: sfx_groundpoundloop, sndid: -1, is_3d: true, func: function() {
		if (obj_player.sprite_index == spr_player_piledriverland)
			return true;}
	},
	superjumphold: {state: states.superjump, sound: sfx_superjumphold, sndid: -1, is_3d: true, func: function() {
		if (obj_player.sprite_index == spr_player_superjump || obj_player.sprite_index == spr_player_Sjumpcancelstart)
			return true;}, looppoints: [0.64, 1.84]
	}
}

idletimer = 120
instakill = false
taunttimer = 0
i_frames = 0
depth = -200
