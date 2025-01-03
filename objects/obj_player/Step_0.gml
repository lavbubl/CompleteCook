get_input()

if grounded
	coyote_time = 10
	
#macro move (-key_left.down + key_right.down)

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
	
collide()

struct_foreach(aftimg_timers, function(_name, _data)
{
	var conditional = false
	switch (_name)
	{
		case "mach":
			if (self.state == states.mach2 || self.state == states.mach3)
				conditional = true
			break;
		case "blur":
			if (self.state == states.grab || self.state == states.tumble || self.state == states.groundpound)
				conditional = true
			break;
		default:
			conditional = true
			break;
	}
	if (_data.timer > 0)
		_data.timer--
	else if conditional
	{
		afterimage_create(_data.effect)
		_data.timer = _data.resetpoint
	}
})

if particletimer > 0
	particletimer--
else
	particle_create(x - 128, y, particles.bleh)
