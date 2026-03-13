// player related macros
#macro p_move (-input.left.check + input.right.check)

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

#endregion

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
flash = 0

aftimg_timers = {
	mach: {timer: 0, effect: after_images.mach, resetpoint: 5, do_it: false},
	blur: {timer: 0, effect: after_images.blur, resetpoint: 2, do_it: false}
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

make_loop_sound = function(_state, _sound, _func = noone, _looppoints = noone, _is_3d = true) constructor
{
	state = _state
	sound = _sound
	sndid = noone
	func = _func
	looppoints = _looppoints
	is_3d = _is_3d
}

my_3d_attributes = new Fmod3DAttributes()
my_3d_attributes.forward.z = 1
my_3d_attributes.up.y = 1

loop_sounds = {
	groundpound: new make_loop_sound(states.groundpound, "event:/sfx/player/groundpound"),
	piledriver: new make_loop_sound(states.piledriver, "event:/sfx/player/groundpound", function() { return obj_player.sprite_index != spr_player_piledriverland}),
	superjumphold: new make_loop_sound(states.superjump, "event:/sfx/player/superjumphold", function() { return obj_player.sprite_index != spr_player_superjump && obj_player.sprite_index != spr_player_Sjumpcancelstart && obj_player.sprite_index != spr_player_presentboxspring}, 
		[0.64, 1.84]),
	ball: new make_loop_sound(states.ball, "event:/sfx/player/ball", function() { return obj_player.sprite_index != spr_player_ballend}),
}

var _mach_event_ref = fmod_studio_system_get_event("event:/sfx/player/mach") //string path
mach_snd = fmod_studio_event_description_create_instance(_mach_event_ref)

var _machslideboost_event_ref = fmod_studio_system_get_event("event:/sfx/player/machslideboost")
machslideboost_snd = fmod_studio_event_description_create_instance(_machslideboost_event_ref)

var _grab_event_ref = fmod_studio_system_get_event("event:/sfx/player/suplexdash")
grab_snd = fmod_studio_event_description_create_instance(_grab_event_ref)

var _getup_event_ref = fmod_studio_system_get_event("event:/sfx/player/rollgetup")
getup_snd = fmod_studio_event_description_create_instance(_getup_event_ref)

var _sjumprelease_event_ref = fmod_studio_system_get_event("event:/sfx/player/superjumprelease")
sjumprelease_snd = fmod_studio_event_description_create_instance(_sjumprelease_event_ref)

followingsnds = [mach_snd, machslideboost_snd, grab_snd, getup_snd, sjumprelease_snd] //what am i doing

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

pal_select = 1
pattern_spr = pat_pizza

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
