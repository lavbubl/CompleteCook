function scr_player_jetpackjump()
{
	alarm[5] = 2
	alarm[7] = 60
	landAnim = 0
	if (grounded && vsp > 0 && (!(place_meeting(x, (y + vsp), obj_destructibles))) && (!(place_meeting(x, (y + vsp), obj_iceblock_breakable))))
		state = states.normal
	with (obj_iceblock_breakable)
	{
		if (place_meeting((x - other.hsp), y, other) or place_meeting((x - other.xscale), y, other) or place_meeting(x, (y - other.vsp), other))
		{
			instance_destroy()
			if (other.vsp < 0)
				other.vsp = -14
			else if (other.vsp > -11)
				other.vsp = -11
			jumpstop = 0
		}
	}
	with (obj_destructibles)
	{
		if (place_meeting((x - other.hsp), y, other) or place_meeting((x - other.xscale), y, other) or place_meeting(x, (y - other.vsp), other))
		{
			instance_destroy()
			if (other.vsp < 0)
				other.vsp = -14
			else if (other.vsp > -11)
				other.vsp = -11
			jumpstop = 0
		}
	}
	with (instance_place((x + xscale), y, obj_tntblock))
	{
		instance_destroy()
		if (other.vsp > -11)
			other.vsp = -11
		jumpstop = 0
	}
	with (instance_place(x, (y + 1), obj_tntblock))
	{
		instance_destroy()
		if (other.vsp > -11)
			other.vsp = -11
		jumpstop = 0
	}
	move = (key_left + key_right)
	dir = xscale
	if (sprite_index != spr_rockethitwall or (!jetpackdash))
	{
		dir = xscale
		if (sprite_index == spr_player_jetpackstart)
		{
			sprite_index = spr_player_jetpackmid
			image_index = 0
		}
		else if (sprite_index == spr_player_jetpackmid && floor(image_index) == (image_number - 1))
			sprite_index = spr_player_jetpackend
		if (move != 0)
		{
			if (move != xscale)
			{
				if (movespeed > 0)
					movespeed -= 0.75
				if (movespeed <= 0)
					xscale = move
			}
			else if (movespeed < 8)
				movespeed += 0.75
		}
		if ((!doublejump) && key_slap2)
		{
			doublejump = 1
			scr_soundeffect(sfx_explosion)
			instance_create(x, y, obj_playerexplosion)
			sprite_index = spr_rockethitwall
			jetpackbounce = 1
			image_index = 0
			if (move != 0)
				xscale = move
			dir = xscale
			movespeed = 12
			jetpackdash = 1
		}
		hsp = (xscale * movespeed)
	}
	else if jetpackdash
	{
		image_speed = 0.35
		hsp = (xscale * movespeed)
		vsp = 0
		if (floor(image_index) == (image_number - 1))
			jetpackdash = 0
	}
	if (place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + xscale), y, obj_destructibles))))
		movespeed = 0
	if (sprite_index == spr_rockethitwall && jetpackbounce == 1 && place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + xscale), y, obj_destructibles))))
	{
		jetpackdash = 0
		instance_create((x + (xscale * 10)), y, obj_bangeffect)
		jetpackbounce = 0
		vsp = -11
		image_index = 0
	}
	hsp = (xscale * movespeed)
	if (firemouth_afterimage > 0)
		firemouth_afterimage--
	else
	{
		firemouth_afterimage = 8
		create_firemouth_afterimage(x, y, sprite_index, (image_index - 1), xscale)
	}
	if (punch_afterimage > 0)
		punch_afterimage--
	else
	{
		punch_afterimage = (8 + irandom_range(-4, 2))
		create_heatpuff((x - (xscale * 2)), y)
	}
	exit;
}

