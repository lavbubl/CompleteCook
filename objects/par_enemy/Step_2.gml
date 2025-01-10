yscale = 1

if (obj_player.state != states.hold && 
	obj_player.state != states.piledriver && 
	obj_player.state != states.punchenemy &&
	obj_player.state != states.swingding)
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
				other.x = x
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
			case spr_player_swingding:
				other.x = x
				other.y = y - 16
				break;
			case spr_player_swingdingend:
				other.x = x + xscale * 64
				other.y = y - 16
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
			if (!grounded && state == states.hold || state == states.swingding)
			{
				sprite_index = spr_player_piledriver
				movespeed = abs(hsp)
				state = states.piledriver
				vsp = -8
				other.yscale = -1
			}
		}
		if (image_index >= image_number - 1 && sprite_index == spr_player_piledriverland)
		{
			other.alarm[0] = 1
			with (other)
				do_enemygibs()
			vsp = -12
			jumpstop = false
			state = states.jump
			reset_anim(spr_player_piledriverjump)
		}
		
		var ixcheck = 7
		if sprite_index == spr_player_finishingblowup
			ixcheck = 5
		if sprite_index == spr_player_swingdingend
			ixcheck = 1
			
		if (state = states.punchenemy && floor(image_index) == ixcheck)
		{
			shake_camera()
			with (other)
			{
				do_enemygibs()
				follow_player = false
				state = e_states.hit
				hsp = xscale * -20
				vsp = 0
				if obj_player.sprite_index == spr_player_finishingblowup
				{
					hsp = 0
					vsp = -20
				}
			}
			global.combo.timer = 60
		}
	}
}
