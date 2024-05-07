function scr_player_fireass()
{
	image_speed = 0.35
	alarm[5] = 2
	alarm[7] = 60
	with (instance_place(x, (y + vsp), obj_ratblock))
		instance_destroy()
	if place_meeting((x + hsp), y, obj_solid)
		image_xscale *= -1
	if (sprite_index == spr_fireass or sprite_index == spr_scaredjump1 or sprite_index == spr_scaredjump2)
	{
		if (floor(image_index) == (image_number - 1) && sprite_index == spr_fireass)
			create_particle(x, (y + 25), states.ejected, 0)
		move = (key_left + key_right)
		hsp = movespeed
		if (move != 0)
		{
			if (move == xscale)
				movespeed = Approach(movespeed, (xscale * 8), 0.5)
			else
				movespeed = Approach(movespeed, 0, 0.5)
			if (movespeed <= 0)
				xscale = move
		}
		else
			movespeed = Approach(movespeed, 0, 0.1)
		if place_meeting(x, (y + 1), obj_haystack)
			vsp = -20
		else if (grounded && vsp > 0 && (!(place_meeting(x, (y + 1), obj_ratblock))))
		{
			movespeed = 6
			if (sprite_index == spr_fireass)
				sprite_index = spr_fireassground
			else
			{
				movespeed = 0
				landAnim = 0
				alarm[5] = 2
				alarm[7] = 60
				hurted = 1
				state = states.normal
				sprite_index = spr_idle
				image_index = 0
			}
			image_index = 0
		}
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_scaredjump1)
		sprite_index = spr_scaredjump2
	if (sprite_index == spr_fireassground)
	{
		hsp = (xscale * movespeed)
		if (movespeed > 0)
			movespeed -= 0.25
		if (floor(image_index) == (image_number - 1))
		{
			movespeed = 0
			landAnim = 0
			alarm[5] = 2
			alarm[7] = 60
			hurted = 1
			state = states.normal
			sprite_index = spr_idle
			image_index = 0
		}
	}
	if (sprite_index == spr_fireassend)
	{
		if (floor(image_index) == (image_number - 1))
		{
			movespeed = 0
			landAnim = 0
			alarm[5] = 2
			alarm[7] = 60
			hurted = 1
			state = states.normal
			sprite_index = spr_idle
			image_index = 0
		}
	}
	exit;
}

