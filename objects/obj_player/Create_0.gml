init_collide()

spawn = "a"
door_type = fade_types.none
hallxscale = 1
hallyscale = 1
wasclimbingwall = false
coyote_time = 0
movespeed = 0
state = states.normal
xscale = 1
jumpstop = false
mach4mode = false
wallspeed = 0
flash = 0

aftimg_timers = {
	mach: {timer: 0, effect: after_images.mach, resetpoint: 6, do_it: false},
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

instakill = false
particletimer = 0
taunttimer = 0
depth = -200
