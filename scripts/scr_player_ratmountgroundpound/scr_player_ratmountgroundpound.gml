function scr_player_ratmountgroundpound()
{
	if (sprite_index == spr_player_ratmountgroundpound)
	{
		if (floor(image_index) == (image_number - 1))
			sprite_index = spr_player_ratmountgroundpoundfall
	}
	move = (key_left + key_right)
	hsp = movespeed
	if key_jump
		input_buffer_jump = 0
	if (brick == 1)
	{
		state = states.ratmountjump
		sprite_index = spr_player_ratmountfall
	}
	if (gustavokicktimer > 0)
		gustavokicktimer--
	if (gustavokicktimer == 0)
	{
		if (sprite_index == spr_lonegustavo_jumpstart)
		{
			vsp = -11
			instance_create(x, (y - 20), obj_bangeffect)
		}
		else
		{
			instance_create((x + (xscale * 20)), y, obj_bangeffect)
			vsp = -4
		}
		gustavokicktimer = -1
	}
	if (sprite_index == spr_lonegustavo_jumpstart && gustavokicktimer > 0)
	{
		vsp = 0
		hsp = 0
	}
	if (move != 0)
	{
		if (sprite_index == spr_lonegustavo_groundpoundland)
			movespeed = Approach(movespeed, (move * ratmount_movespeed), 0.25)
		else
			movespeed = Approach(movespeed, (move * ratmount_movespeed), 0.5)
	}
	else
		movespeed = Approach(movespeed, 0, 0.5)
	if (sprite_index == spr_lonegustavo_groundpoundstart && floor(image_index) == (image_number - 1))
	{
		image_index = 0
		sprite_index = spr_lonegustavo_groundpound
	}
	if (sprite_index == spr_lonegustavo_groundpound or sprite_index == spr_lonegustavo_groundpoundstart)
	{
		vsp++
		if (grounded && vsp > 0 && (!(place_meeting(x, (y + vsp), obj_destructibles))) && (!(place_meeting(x, ((y + vsp) + 2), obj_destructibles))) && (!(place_meeting(x, (y + 10), obj_destructibles))))
		{
			if (move != 0)
				movespeed = (xscale * 3)
			scr_soundeffect(sfx_groundpound)
			sprite_index = spr_lonegustavo_groundpoundland
			image_index = 0
			jumpAnim = 1
			jumpstop = 0
			with (obj_camera)
			{
				shake_mag = 5
				shake_mag_acc = (15 / room_speed)
			}
			if (freefallsmash >= 10)
			{
				with (obj_baddie)
				{
					if (shakestun && grounded && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0 && (!invincible) && groundpound)
					{
						state = states.stun
						if (stunned < 60)
							stunned = 60
						vsp = -11
						image_xscale *= -1
						hsp = 0
						momentum = 0
					}
				}
				with (obj_camera)
				{
					shake_mag = 10
					shake_mag_acc = (30 / room_speed)
				}
				combo = 0
				bounce = 0
			}
			create_particle(x, (y + 3), particle.groundpoundeffect, 0)
		}
	}
	if (sprite_index == spr_lonegustavo_groundpoundland && floor(image_index) == (image_number - 1))
	{
		sprite_index = spr_lonegustavo_idle
		state = states.ratmount
	}
	if ((sprite_index == spr_lonegustavo_kick or sprite_index == spr_lonegustavo_jumpstart) && floor(image_index) == (image_number - 1))
	{
		if (sprite_index == spr_lonegustavo_kick)
			sprite_index = spr_player_ratmountgroundpoundfall
		else
			sprite_index = spr_lonegustavo_jump
		state = states.ratmount
	}
	image_speed = 0.35
	if (punch_afterimage > 0)
		punch_afterimage--
	else
	{
		punch_afterimage = 5
		create_blue_afterimage(x, y, sprite_index, image_index, xscale)
	}
	exit;
}

