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
	
collide()

struct_foreach(aftimg_timers, function(_name, _data)
{
	var conditional = false
	if (_data.do_it)
		conditional = true
	if (_data.timer > 0)
		_data.timer--
	else if conditional
	{
		afterimage_create(_data.effect)
		_data.timer = _data.resetpoint
	}
})

if ladderbuffer > 0
	ladderbuffer--

/*if particletimer > 0
	particletimer--
else
	particle_create(x - 128, y, particles.bleh)*/
