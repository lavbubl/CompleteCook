yscale = 1

if (obj_player.state != states.hold && obj_player.state != states.piledriver && obj_player.state != states.punchenemy)
	follow_player = false

if (!follow_player && state == e_states.grabbed)
{
	stun_timer = 180
	state = e_states.stun
}

if follow_player
{
	hsp = 0
	vsp = 0
	with (obj_player)
	{
		switch (sprite_index)
		{
			case spr_player_holdidle:
			case spr_player_holdmove:
			case spr_player_holdjump:
			case spr_player_holdfall:
			case spr_player_holdland:
			case spr_player_holdrise:
				other.x = x
				other.y = y - 64
				other.xscale = -xscale
				if (sprite_index == spr_player_holdrise)
					other.y += floor(image_number - image_index) * 10
				break;
			case spr_player_piledriver:
				other.x = x + image_index
				other.y = y
				other.yscale = -1
				break;
			case spr_player_piledriverland:
				other.x = x
				other.y = y
				other.yscale = -1
				break;
			case spr_player_finishingblow_1:
			case spr_player_finishingblow_2:
			case spr_player_finishingblow_3:
			case spr_player_finishingblow_4:
			case spr_player_finishingblow_5:
				other.x = x + xscale * 64
				other.y = y - 16
				break;
			case spr_player_finishingblowup:
				other.x = x + xscale * 10
				other.y = y - 64
				break;
		}
		other.state = e_states.grabbed
		if (key_down.down)
		{
			if (grounded && state == states.hold)
			{
				state = states.normal
				with (other)
				{
					follow_player = false
					y = other.y
					state = e_states.stun
					stun_timer = 180
				}
			}
			if (!grounded && state != states.piledriver)
			{
				movespeed = abs(hsp)
				state = states.piledriver
				vsp = -8
				sprite_index = spr_player_piledriver
			}
		}
		if (image_index >= image_number - 1 && sprite_index == spr_player_piledriverland)
		{
			other.alarm[0] = 1
			do_enemygibs()
			vsp = -12
			jumpstop = false
			state = states.jump
			reset_anim(spr_player_piledriverjump)
		}
		var ixcheck = sprite_index == spr_player_finishingblowup ? 5 : 7
		if (state = states.punchenemy && floor(image_index) == ixcheck)
		{
			shake_camera()
			other.follow_player = false
			other.state = e_states.hit
			other.hsp = xscale * 20
			other.vsp = 0
			if obj_player.sprite_index == spr_player_finishingblowup
			{
				other.hsp = 0
				other.vsp = -20
			}
			global.combo.timer = 60
		}
	}
}
