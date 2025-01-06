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
}

if (state != states.normal)
{
	breakdance_secret.buffer = 0
	breakdance_secret.spd = 0.1
}

if coyote_time > 0
	coyote_time--
	
if flash > 0
	flash--
	
if (state == states.tumble || state == states.crouch)
	mask_index = mask_player_small
else
	mask_index = mask_player
	
if taunttimer > 0
	taunttimer--
	
grav = 0.5
if (state == states.ladder)
	grav = 0
	
if (y > room_height + 200 && state != states.actor)
{
	instance_create(0, 0, obj_technicaldifficulty)
	state = states.actor
	hsp = 0
	vsp = 0
	sprite_index = spr_player_idle
}
	
collide()

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

if (state == states.mach3 && !obj_particlecontroller.active_particles.machcharge)
	particle_create(x, y, particles.machcharge, xscale)

if ladderbuffer > 0
	ladderbuffer--



/*if particletimer > 0
	particletimer--
else
	particle_create(x - 128, y, particles.bleh)*/
