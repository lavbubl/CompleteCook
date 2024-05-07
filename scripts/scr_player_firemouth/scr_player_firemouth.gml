function scr_player_firemouth()
{
	alarm[5] = 2
	alarm[7] = 60
	move = (key_left + key_right)
	with (instance_place((x + hsp), y, obj_iceblock_breakable))
	{
		instance_destroy()
		if (other.vsp > -11)
			other.vsp = -11
		jumpstop = 0
	}
	with (instance_place((x + xscale), y, obj_iceblock_breakable))
	{
		instance_destroy()
		if (other.vsp > -11)
			other.vsp = -11
		jumpstop = 0
	}
	with (instance_place(x, (y + vsp), obj_iceblock_breakable))
	{
		instance_destroy()
		if (other.vsp > -11)
			other.vsp = -11
		jumpstop = 0
	}
	with (instance_place(x, (y + vsp), obj_ratblock))
		instance_destroy()
	if (scr_slope() && hsp != 0 && movespeed > 8)
		scr_player_addslopemomentum(0.1, 0.25)
	with (instance_place((x + xscale), y, obj_destructibles))
	{
		instance_destroy()
		if (other.vsp > -11)
			other.vsp = -11
		jumpstop = 0
	}
	with (instance_place((x + xscale), y, obj_tntblock))
	{
		instance_destroy()
		if (other.vsp > -11)
			other.vsp = -11
		jumpstop = 0
	}
	with (instance_place(x, (y + vsp), obj_tntblock))
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
	if key_jump
		input_buffer_jump = 0
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 2
		jumpstop = 1
	}
	if (grounded && vsp > 0)
		jumpstop = 0
	mach2 = 0
	landAnim = 0
	alarm[5] = 2
	if (sprite_index == spr_firemouthintro && floor(image_index) == (image_number - 1))
	{
		scr_losepoints()
		sprite_index = spr_firemouth
		dir = xscale
	}
	if (key_down2 && (!grounded))
		vsp += 10
	if (sprite_index != spr_firemouthintro && sprite_index != spr_firemouthend)
	{
		move = (key_left + key_right)
		if grounded
		{
			doublejump = 0
			if (move != 0)
			{
				if (movespeed <= 8)
					movespeed += 0.5
				xscale = move
			}
			else
				movespeed = Approach(movespeed, 0, 0.5)
			if (dir != xscale)
			{
				dir = xscale
				movespeed = 0
			}
			hsp = (xscale * movespeed)
			if (hsp != 0)
				sprite_index = spr_firemouth
			else
				sprite_index = spr_player_firemouthidle
		}
		else if (sprite_index != spr_player_firemouthdash)
		{
			dir = xscale
			sprite_index = spr_player_firemouthspin
			if (move != 0)
			{
				if (move != xscale)
				{
					if (movespeed > 0)
						movespeed -= 0.5
					if (movespeed <= 0)
						xscale = move
				}
				else if (movespeed < 8)
					movespeed += 0.5
			}
			if ((!doublejump) && key_slap2)
			{
				doublejump = 1
				sprite_index = spr_player_firemouthdash
				image_index = 0
				if (move != 0)
					xscale = move
				dir = xscale
				movespeed = 12
			}
			hsp = (xscale * movespeed)
		}
		else
		{
			hsp = (xscale * movespeed)
			vsp = 0
			if (floor(image_index) == (image_number - 1))
				sprite_index = spr_player_firemouthspin
		}
		if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_tntblock))) && (!(place_meeting((x + hsp), y, obj_iceblock))) && (!(place_meeting((x + hsp), y, obj_ratblock))))
			movespeed = 0
		if (firemouth_afterimage > 0)
			firemouth_afterimage--
		else
		{
			firemouth_afterimage = 8
			create_firemouth_afterimage(x, y, sprite_index, (image_index - 1), xscale)
		}
	}
	else
	{
		hsp = 0
		movespeed = 0
	}
	if (sprite_index == spr_firemouthend && floor(image_index) == (image_number - 1))
	{
		alarm[5] = 2
		alarm[7] = 60
		state = states.normal
		sprite_index = spr_player_idle
		image_index = 0
	}
	if (input_buffer_jump < 8 && grounded && sprite_index != spr_firemouthintro && sprite_index != spr_firemouthend)
	{
		with (instance_create(x, y, obj_highjumpcloud2))
			sprite_index = spr_player_firemouthjumpdust
		vsp = -15
	}
	if (sprite_index == spr_firemouth)
	{
		if (movespeed < 4)
			image_speed = 0.35
		else if (movespeed > 4 && movespeed < 8)
			image_speed = 0.45
		else
			image_speed = 0.6
	}
	else if (sprite_index == spr_player_firemouthspin)
	{
		image_speed = (abs(vsp) / 10)
		if (image_speed < 0.25)
			image_speed = 0.25
	}
	else
		image_speed = 0.35
	if (hsp != 0 && (floor(image_index) == 0 or floor(image_index) == 2) && steppy == 0 && grounded)
		steppy = 1
	if (floor(image_index) != 0 && floor(image_index) != 2)
		steppy = 0
	if ((!instance_exists(obj_dashcloud)) && grounded && hsp != 0)
	{
		with (instance_create(x, y, obj_dashcloud))
			image_xscale = other.xscale
	}
	exit;
}

