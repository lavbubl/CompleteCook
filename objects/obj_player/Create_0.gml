// player related macros
#macro p_move (-input.left.check + input.right.check)

enum character 
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

#endregion

#region Player Sprites

spr_player_backslide  = spr_playerP_backslide 
spr_player_ball = spr_playerP_ball
spr_player_ballend = spr_playerP_ballend
spr_player_bodyslamfall = spr_playerP_bodyslamfall
spr_player_bodyslamstart = spr_playerP_bodyslamstart
spr_player_bodyslamland = spr_playerP_bodyslamland
spr_player_bossdefeated = spr_playerP_bossdefeated
spr_player_breakdance = spr_playerP_breakdance
spr_player_bump = spr_playerP_bump
spr_player_ceilinghit = spr_playerP_ceilinghit
spr_player_climbwall = spr_playerP_climbwall
spr_player_clingwall = spr_playerP_clingwall
spr_player_crawl = spr_playerP_crawl
spr_player_crazyrun = spr_playerP_crazyrun
spr_player_crouch = spr_playerP_crouch
spr_player_crouchdown = spr_playerP_crouchdown
spr_player_crouchfall = spr_playerP_crouchfall
spr_player_crouchslip = spr_playerP_crouchslip
spr_player_dashpad = spr_playerP_dashpad
spr_player_dead = spr_playerP_dead
spr_player_defeat = spr_playerP_defeat
spr_player_defeatland = spr_playerP_defeatland
spr_player_dive = spr_playerP_dive
spr_player_downpizzabox = spr_playerP_downpizzabox
spr_player_entergate = spr_playerP_entergate
spr_player_enterkeydoor = spr_playerP_enterkeydoor
spr_player_facehurt = spr_playerP_facehurt
spr_player_fall = spr_playerP_fall
spr_player_fallface = spr_playerP_fallface
spr_player_finishingblow1 = spr_playerP_finishingblow1
spr_player_finishingblow2 = spr_playerP_finishingblow2
spr_player_finishingblow3 = spr_playerP_finishingblow3
spr_player_finishingblow4 = spr_playerP_finishingblow4
spr_player_finishingblow5 = spr_playerP_finishingblow5
spr_player_fireass = spr_playerP_fireass
spr_player_fireassground = spr_playerP_fireassground
spr_player_freefall = spr_playerP_freefall
spr_player_freefallland = spr_playerP_freefallland
spr_player_gottreasure = spr_playerP_gottreasure
spr_player_grind = spr_playerP_grind
spr_player_haulingfall = spr_playerP_haulingfall
spr_player_haulingidle = spr_playerP_haulingidle
spr_player_haulingjump = spr_playerP_haulingjump
spr_player_haulingland = spr_playerP_haulingland
spr_player_haulingmove = spr_playerP_haulingmove
spr_player_haulingrise = spr_playerP_haulingrise
spr_player_hurt = spr_playerP_hurt
spr_player_hurtbehind = spr_playerP_hurtbehind
spr_player_hurtidle = spr_playerP_hurtidle
spr_player_hurtjump = spr_playerP_hurtjump
spr_player_hurtmove = spr_playerP_hurtmove
spr_player_idle = spr_playerP_idle
spr_player_idlebite = spr_playerP_idlebite
spr_player_idlecareless = spr_playerP_idlecareless
spr_player_idledance = spr_playerP_idledance
spr_player_idlefrown = spr_playerP_idlefrown
spr_player_idlehand = spr_playerP_idlehand
spr_player_idlewhat = spr_playerP_idlewhat
spr_player_jump = spr_playerP_jump
spr_player_keyget = spr_playerP_keyget
spr_player_kungfu1 = spr_playerP_kungfu1
spr_player_kungfu2 = spr_playerP_kungfu2
spr_player_kungfu3 = spr_playerP_kungfu3
spr_player_ladder = spr_playerP_ladder
spr_player_ladderdown = spr_playerP_ladderdown
spr_player_laddermove = spr_playerP_laddermove
spr_player_land = spr_playerP_land
spr_player_landmove = spr_playerP_landmove
spr_player_longjump = spr_playerP_longjump
spr_player_lookdoor = spr_playerP_lookdoor
spr_player_lungehit = spr_playerP_lungehit
spr_player_mach1 = spr_playerP_mach1
spr_player_mach2 = spr_playerP_mach2
spr_player_mach2jump = spr_playerP_mach2jump
spr_player_mach3 = spr_playerP_mach3
spr_player_mach3hit = spr_playerP_mach3hit
spr_player_mach3hitwall = spr_playerP_mach3hitwall
spr_player_mach3jump = spr_playerP_mach3jump
spr_player_machfreefall = spr_playerP_machfreefall
spr_player_machroll = spr_playerP_machroll
spr_player_machslideboost = spr_playerP_machslideboost
spr_player_machslideboost3 = spr_playerP_machslideboost3
spr_player_machslideboost3fall = spr_playerP_machslideboost3fall
spr_player_machslideboostfall = spr_playerP_machslideboostfall
spr_player_machslideend = spr_playerP_machslideend
spr_player_machslidestart = spr_playerP_machslidestart
spr_player_madidle = spr_playerP_madidle
spr_player_madmove = spr_playerP_madmove
spr_player_move = spr_playerP_move
spr_player_panic = spr_playerP_panic
spr_player_parry1 = spr_playerP_parry1
spr_player_parry2 = spr_playerP_parry2
spr_player_parry3 = spr_playerP_parry3
spr_player_piledriver = spr_playerP_piledriver
spr_player_piledriverjump = spr_playerP_piledriverjump
spr_player_piledriverland = spr_playerP_piledriverland
spr_player_poundcancel1 = spr_playerP_poundcancel1
spr_player_poundcancel2 = spr_playerP_poundcancel2
spr_player_presentboxspring  = spr_playerP_presentboxspring 
spr_player_rageidle = spr_playerP_rageidle
spr_player_ragemove  = spr_playerP_ragemove 
spr_player_rockethitwall = spr_playerP_rockethitwall
spr_player_rollgetup = spr_playerP_rollgetup
spr_player_scared = spr_playerP_scared
spr_player_secondjump = spr_playerP_secondjump
spr_player_secondjumploop = spr_playerP_secondjumploop
spr_player_shotgun_crouch = spr_playerP_shotgun_crouch
spr_player_shotgun_crouchfall = spr_playerP_shotgun_crouchfall
spr_player_shotgun_crouchmove = spr_playerP_shotgun_crouchmove
spr_player_shotgun_crouchstart = spr_playerP_shotgun_crouchstart
spr_player_shotgun_fall = spr_playerP_shotgun_fall
spr_player_shotgun_idle = spr_playerP_shotgun_idle
spr_player_shotgun_jump = spr_playerP_shotgun_jump
spr_player_shotgun_land = spr_playerP_shotgun_land
spr_player_shotgun_move = spr_playerP_shotgun_move
spr_player_shotgun_pickup = spr_playerP_shotgun_pickup
spr_player_shotgun_shoot = spr_playerP_shotgun_shoot
spr_player_shotgun_shootdown = spr_playerP_shotgun_shootdown
spr_player_shotgun_shootdownland = spr_playerP_shotgun_shootdownland
spr_player_Sjumpcancel = spr_playerP_Sjumpcancel
spr_player_Sjumpcancelstart = spr_playerP_Sjumpcancelstart
spr_player_slipbanana1 = spr_playerP_slipbanana1
spr_player_slipbanana2 = spr_playerP_slipbanana2
spr_player_stomp = spr_playerP_stomp
spr_player_superjump = spr_playerP_superjump
spr_player_superjumpflash = spr_playerP_superjumpflash
spr_player_superjumpmove = spr_playerP_superjumpmove
spr_player_superjumpprep = spr_playerP_superjumpprep
spr_player_supertaunt1 = spr_playerP_supertaunt1
spr_player_supertaunt2 = spr_playerP_supertaunt2
spr_player_supertaunt3 = spr_playerP_supertaunt3
spr_player_supertaunt4 = spr_playerP_supertaunt4
spr_player_suplexbump = spr_playerP_suplexbump
spr_player_suplexcancel = spr_playerP_suplexcancel
spr_player_suplexdash = spr_playerP_suplexdash
spr_player_suplexgrabjump = spr_playerP_suplexgrabjump
spr_player_swingding = spr_playerP_swingding
spr_player_swingdingend = spr_playerP_swingdingend
spr_player_taunt = spr_playerP_taunt
spr_player_timesup = spr_playerP_timesup
spr_player_uppercut = spr_playerP_uppercut
spr_player_uppercutfinishingblow = spr_playerP_uppercutfinishingblow
spr_player_uppizzabox = spr_playerP_uppizzabox
spr_player_walkfront = spr_playerP_walkfront
spr_player_walljumpend = spr_playerP_walljumpend
spr_player_walljumpstart = spr_playerP_walljumpstart
spr_player_wallsplat = spr_playerP_wallsplat
spr_player_winding = spr_playerP_winding

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

loop_sounds = {
	mach1: new make_loop_sound(states.mach2, sfx_mach1, function() { return obj_player.sprite_index == obj_player.spr_player_mach1;}),
	mach2: new make_loop_sound(states.mach2, sfx_mach2, function() { return obj_player.sprite_index == obj_player.spr_player_mach2;}),
	mach3: new make_loop_sound(states.mach3, sfx_mach3, function() { return obj_player.sprite_index != obj_player.spr_player_crazyrun;}),
	mach4: new make_loop_sound(states.mach3, sfx_mach4, function() { return obj_player.sprite_index == obj_player.spr_player_crazyrun;}),
	climbwall: new make_loop_sound(states.climbwall, sfx_mach2),
	groundpound: new make_loop_sound(states.groundpound, sfx_groundpoundloop),
	piledriver: new make_loop_sound(states.piledriver, sfx_groundpoundloop, function() { return obj_player.sprite_index != obj_player.spr_player_piledriverland}),
	superjumphold: new make_loop_sound(states.superjump, sfx_superjumphold, function() { return obj_player.sprite_index != obj_player.spr_player_superjump && obj_player.sprite_index != obj_player.spr_player_Sjumpcancelstart && obj_player.sprite_index != obj_player.spr_player_presentboxspring}, 
		[0.64, 1.84]),
	ball: new make_loop_sound(states.ball, sfx_ballroll, function() { return obj_player.sprite_index != obj_player.spr_player_ballend}),
}

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
