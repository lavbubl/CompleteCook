function scr_player_boxxedpep()
{
	mask_index = spr_crouchmask
	if (boxxeddash == 1)
		image_speed = (abs(movespeed) / 15)
	else
		image_speed = 0.5
	doublejump = 0
	if (abs(hsp) <= 2)
		boxxeddash = 0
	if key_jump
		input_buffer_jump = 0
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 2
		jumpstop = 1
	}
	if (grounded && vsp > 0)
		jumpstop = 0
	if (dir != xscale)
		dir = xscale
	if (sprite_index != spr_boxxedpepintro)
	{
		move = (key_left + key_right)
		if place_meeting(x, (y + 1), obj_railparent)
		{
			var _railinst = instance_place(x, (y + 1), obj_railparent)
			railmovespeed = _railinst.movespeed
			raildir = _railinst.dir
		}
		hsp = (movespeed + (railmovespeed * raildir))
	}
	if (scr_solid((x + sign(hsp)), y) && xscale == 1 && move == 1 && ((!(place_meeting((x + 1), y, obj_slope))) or scr_solid_slope((x + 1), y)))
		movespeed = 0
	if (scr_solid((x + sign(hsp)), y) && xscale == -1 && move == -1 && ((!(place_meeting((x - 1), y, obj_slope))) or scr_solid_slope((x - 1), y)))
		movespeed = 0
	if (grounded && input_buffer_jump < 8 && vsp > 0 && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
	{
		instance_create(x, y, obj_highjumpcloud2)
		vsp = (-boxxedpepjump)
		state = states.boxxedpepjump
		sprite_index = spr_boxxedpep_flap
		image_index = 0
		repeat (7)
		{
			with (instance_create((x + random_range(-50, 50)), (y + random_range(0, 50)), obj_highjumpcloud2))
			{
				vspeed = 2
				sprite_index = spr_cloudeffect
			}
		}
		jumpstop = 0
	}
	if (sprite_index == spr_boxxedpepdash or sprite_index == spr_boxxedpepdashstart)
	{
		sprite_index = spr_boxxedpepdashend
		image_index = 0
	}
	if (sprite_index == spr_boxxedpepdashend && floor(image_index) == (image_number - 1))
		sprite_index = (move != 0 ? spr_boxxedpepwalk : spr_boxxedpepidle)
	if (sprite_index != spr_boxxedpepintro)
	{
		if (move != 0)
		{
			if (((xscale > 0 && movespeed < 8) or (xscale < 0 && movespeed > -8)) && move == xscale)
				movespeed += (xscale * 0.8)
			if (boxxeddash == 0)
				xscale = move
			else if (move != xscale)
				movespeed = Approach(movespeed, 0, 0.8)
		}
		else if (boxxeddash == 0)
			movespeed = Approach(movespeed, 0, 0.8)
		else
			movespeed = Approach(movespeed, 0, 0.25)
	}
	if (sprite_index == spr_boxxedpepintro && floor(image_index) == (image_number - 1))
		sprite_index = spr_boxxedpepidle
	if (sprite_index != spr_boxxedpepintro)
	{
		if (sprite_index != spr_boxxedpep_flap)
		{
			if grounded
			{
				if (sprite_index != spr_boxxedpepdashend)
				{
					if (hsp != 0)
						sprite_index = spr_boxxedpepwalk
					else
						sprite_index = spr_boxxedpepidle
				}
			}
			else
			{
				sprite_index = spr_boxxedpepair
				state = states.boxxedpepjump
			}
		}
	}
	if key_slap2
	{
		state = states.boxxedpepspin
		sprite_index = spr_boxxedpep_spin
		image_index = 0
		vsp = -6
		instance_create(x, y, obj_stompeffect)
	}
	if ((!instance_exists(obj_cloudeffect)) && grounded && move != 0 && (floor(image_index) == 4 or floor(image_index) == 10))
		instance_create(x, (y + 43), obj_cloudeffect)
	if ((!instance_exists(obj_cloudeffect)) && grounded && move != 0 && (sprite_index == spr_player_downslopes or sprite_index == spr_player_upslopes))
		instance_create(x, (y + 43), obj_cloudeffect)
	if (move != 0 && (floor(image_index) == 3 or floor(image_index) == 8) && steppy == 0)
		steppy = 1
	if (move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
		steppy = 0
	exit;
}

