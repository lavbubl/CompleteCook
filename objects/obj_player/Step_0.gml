if !obj_shell.isOpen
	get_input()

struct_foreach(aftimg_timers, function(_name, _data)
{
	_data.do_it = false
})

if grounded
	coyote_time = 10
else if vsp < 0
	coyote_time = 0

#macro p_move (-key_left.down + key_right.down)

instakill = false

prevstate = state

input_buffers.grab = max(input_buffers.grab - 1, 0)
input_buffers.jump = max(input_buffers.jump - 1, 0)

if key_grab.pressed
	input_buffers.grab = 15
	
if key_jump.pressed
	input_buffers.jump = 15

if warping
	exit;

if hitstun > 0
{
	hitstun--
	exit;
}

switch (state)
{
	case states.taunt:
		player_taunt()
		break;
	case states.normal:
		player_normal()
		break;
	case states.jump:
		player_jump()
		break;
	case states.mach2:
		player_mach2()
		break;
	case states.mach3:
		player_mach3()
		break;
	case states.tumble:
		player_tumble()
		break;
	case states.slide:
		player_slide()
		break;
	case states.climbwall:
		player_climbwall()
		break;
	case states.bump:
		player_bump()
		break;
	case states.groundpound:
		player_groundpound()
		break;
	case states.grab:
		player_grab()
		break;
	case states.superjump:
		player_superjump()
		break;
	case states.crouch:
		player_crouch()
		break;
	case states.actor:
		player_actor()
		break;
	case states.ladder:
		player_ladder()
		break;
	case states.punch:
		player_punch()
		break;
	case states.hold:
		player_hold()
		break;
	case states.punchenemy:
		player_punchenemy()
		break;
	case states.piledriver:
		player_piledriver()
		break;
	case states.swingding:
		player_swingding()
		break;
	case states.grind:
		player_grind()
		break;
	case states.hurt:
		player_hurt()
		break;
	case states.parry:
		player_parry()
		break;
	case states.backtohub:
		player_backtohub()
		break;
	case states.noclip:
		player_noclip()
		break;
}

if (state != states.normal)
{
	breakdance_secret.buffer = 0
	breakdance_secret.spd = 0.25
}

if coyote_time > 0
	coyote_time--
	
if flash > 0
	flash--
	
if state != states.normal
	idletimer = 180
	
if state != states.jump
	fallingtimer = 0
	
if (idletimer > 0 && state == states.normal)
	idletimer--

if (i_frames > 0 && state != states.hurt)
	i_frames--

if (state == states.tumble || state == states.crouch)
	mask_index = mask_player_small
else
	mask_index = mask_player

grav = 0.5
if (state == states.ladder)
	grav = 0
	
if ((y > room_height + 200 || y < -200) && state != states.actor && state != states.backtohub)
{
	shake_camera()
	instance_create(0, 0, obj_technicaldifficulty)
	state = states.actor
	hsp = 0
	vsp = 0
	sprite_index = spr_player_idle
}

if (state != states.noclip && state != states.backtohub)
	collide()
	

break_destroyables()

struct_foreach(aftimg_timers, function(_name, _data)
{
	if (_data.timer > 0)
		_data.timer--
	else if _data.do_it
	{
		afterimage_create(_data.effect)
		_data.timer = _data.resetpoint
	}
})

if ladderbuffer > 0
	ladderbuffer--

var spd = 0.05

if secret_cutscene
	visual_size = max(visual_size - spd, 0)
else
	visual_size = min(visual_size + spd, 1)

if supertauntcount >= 10
{
	supertauntcount = 10
	if !supertauntshow
	{
		scr_sound(sfx_rankup1)
		supertauntshow = true
	}
	
	if supertauntbuffer > 0
		supertauntbuffer--;
	else if (state == states.normal || state == states.jump || state == states.mach2 || state == states.mach3)
	{
		supertauntbuffer = 4;
		create_effect(x + irandom_range(-25, 25), y + irandom_range(-10, 35), asset_get_index($"spr_supertauntspark{irandom_range(1, 5)}"))
	}
}
