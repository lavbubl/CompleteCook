// player related macros
#macro p_move (-input.left.check + input.right.check)

enum characters
{
	peppino,
	noise
}

// initialize input
input =
{
	left: new Input(global.keybinds.left),
	right: new Input(global.keybinds.right),
	up: new Input(global.keybinds.up),
	down: new Input(global.keybinds.down),
	jump: new Input(global.keybinds.jump),
	grab: new Input(global.keybinds.grab),
	dash: new Input(global.keybinds.dash),
	taunt: new Input(global.keybinds.taunt),
	superjump: new Input(global.keybinds.superjump),
	groundpound: new Input(global.keybinds.groundpound)
}

collide_init()

#region Player States

player_states = [];

player_states[states.taunt] = player_taunt;
player_states[states.normal] = player_normal;
player_states[states.jump] = player_jump;
player_states[states.mach2] = player_mach2;
player_states[states.mach3] = player_mach3;
player_states[states.tumble] = player_tumble;
player_states[states.slide] = player_slide;
player_states[states.climbwall] = player_climbwall;
player_states[states.bump] = player_bump;
player_states[states.groundpound] = player_groundpound;
player_states[states.grab] = player_grab;
player_states[states.superjump] = player_superjump;
player_states[states.crouch] = player_crouch;
player_states[states.actor] = player_actor;
player_states[states.ladder] = player_ladder;
player_states[states.punch] = player_punch;
player_states[states.hold] = player_hold;
player_states[states.punchenemy] = player_punchenemy;
player_states[states.piledriver] = player_piledriver;
player_states[states.swingding] = player_swingding;
player_states[states.grind] = player_grind;
player_states[states.hurt] = player_hurt;
player_states[states.parry] = player_parry;
player_states[states.backtohub] = player_backtohub;
player_states[states.noclip] = player_noclip;
player_states[states.defeat] = player_defeat;
player_states[states.punchstun] = player_punchstun;
player_states[states.fireass] = player_fireass;
player_states[states.shotgunshoot] = player_shotgunshoot;
player_states[states.ball] = player_ball;
player_states[states.slip] = player_slip;
player_states[states.divebomb] = player_divebomb;
player_states[states.wallbounce] = player_wallbounce;
player_states[states.crusher] = player_crusher;

#endregion

make_loop_sound = function(_state, _sound, _func = noone, _looppoints = noone, _is_3d = true) constructor
{
	state = _state
	sound = _sound
	sndid = noone
	func = _func
	looppoints = _looppoints
	is_3d = _is_3d
}

character = characters.noise
charletter = "N"
pal_select = 1
pattern_spr = pat_pizza
asset_player_reset(charletter)

spawn = "a"
door_type = fade_types.none
wasclimbingwall = false
coyote_time = 0
movespeed = 0
state = states.normal
image_speed = 0.35
prevstate = state
xscale = 1
jumpstop = false
mach4mode = false
wallspeed = 0
wallbouncedampen = 0
flash = 0

aftimg_timers = {
	mach: {timer: 0, effect: after_images.mach, resetpoint: 5, do_it: false},
	blur: {timer: 0, effect: after_images.blur, resetpoint: 2, do_it: false},
	noise: {timer: 0, effect: after_images.noise, resetpoint: 5, do_it: false}
}

/*ptcl_timers = {
	bleh: 0
} what was this again?*/

dir = 0
momentum = false
freefallsmash = 0
crouchslipbuffer = 0
grabclimbbuffer = 0
ladderbuffer = 0
has_shotgun = false
intransfo = false
prev_transfo = false

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

machNsnd = noone
machNgroundsnd = noone

visual_size = 1
secret_exit = false
secret_cutscene = false
idletimer = 120
instakill = false
taunttimer = 0
i_frames = 0
particle_timer = 0
particle_timer2 = 0
flamecloud_buffer = 0
haskey = false
hasgerome = false
fallingtimer = 0

depth = -75

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
prev_ix = 0
supertauntcount = 0
supertauntshow = false
supertauntbuffer = 0
myemitter = noone
pausestopframe = false
winding = 0

prev_g_room = 0
prev_g_door = "a"

uparrow = {
	yoffset: -50,
	visible: false,
	sprite_index: spr_uparrow,
	image_speed: 0.35,
	image_index: 0
}
