yscale = 1

if (obj_player.state != states.hold && 
	obj_player.state != states.piledriver && 
	obj_player.state != states.punchenemy &&
	obj_player.state != states.swingding)
	follow_player = false

if (!follow_player && state == states.grabbed)
{
	stun_timer = 180
	state = states.stun
}

switch (object_index)
{
	case obj_forknight:
		if (sprite_index == sprs.move && hurtbox_id == -4)
			create_hurtbox()
		else if (sprite_index != sprs.move && hurtbox_id != -4)
			destroy_hurtbox()
		break;
}

if follow_player
{
	hsp = 0
	vsp = 0
	with (obj_player)
	{
		switch (state)
		{
			case states.hold:
				other.x = x
				other.y = y - 64
				other.xscale = -xscale
				if sprite_index == spr_player_haulingrise
					other.y += floor(image_number - image_index) * 10
				break;
			case states.piledriver:
				other.x = x
				other.y = y
				other.yscale = -1
				break;
			case states.punchenemy:
				other.x = x + xscale * 48
				other.y = y - 20
				break;
			case states.swingding:
				other.x = x
				other.y = y - 20
				break;
		}
		other.state = states.grabbed
		if key_down.down
		{
			if (grounded && state == states.hold)
			{
				state = states.normal
				with other
				{
					follow_player = false
					y = other.y
					state = states.stun
					stun_timer = 180
				}
			}
			if (!grounded && (state == states.hold || state == states.swingding))
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
			with (other)
			{
				do_enemygibs()
				alarm[0] = 5
			}
			
			vsp = -12
			jumpstop = false
			state = states.jump
			hitstun = 5
			prev_ix = image_index
			reset_anim(spr_player_piledriverjump)
		}
		
		var ixcheck = 5
		if sprite_index == spr_player_swingdingend
			ixcheck = 1
			
		if (state = states.punchenemy && floor(image_index) == ixcheck)
		{
			shake_camera()
			scr_sound_3d(sfx_punch, x, y)
			scr_sound_3d(sfx_killingblow, x, y)
			do_enemygibs()
			with other
			{
				follow_player = false
				state = states.hit
				hsp = other.xscale * 20
				vsp = 0
				if other.sprite_index == spr_player_uppercutfinishingblow
				{
					hsp = 0
					vsp = -20
				}
			}
			global.combo.timer = 60
		}
	}
}

if string_starts_with(sprite_get_name(obj_player.sprite_index), "spr_player_supertaunt") && bbox_in_camera()
{
	x += irandom_range(-1, 1)
	y += irandom_range(-1, 1)
	state = states.stun
	stun_timer = 2
	sprite_index = sprs.stun
}
