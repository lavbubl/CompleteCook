function anim_ended()
{
	return image_index + image_speed >= image_number
}

function do_groundpound()
{
	if (key_down.pressed)
	{
		state = states.groundpound
		sprite_index = spr_player_bodyslamstart
		image_index = 0
		vsp = -6
	}
}

function do_grab()
{
	if (key_attack.pressed)
	{
		if (!key_up.down)
		{
			if (movespeed < 6)
				movespeed = 6
			state = states.grab
			reset_anim(spr_player_suplexgrab)
		}
		else
		{
			vsp = grounded ? -14 : -10
			hsp = abs(hsp) * xscale
			state = states.punch
			reset_anim(spr_player_uppercut)
			image_speed = 0.35
			scr_sound_pitched(sfx_uppercut)
		}
	}
}

function do_taunt()
{
	if (key_taunt.pressed)
	{
		prev = {
			state: self.state,
			hsp: self.hsp,
			vsp: self.vsp,
			sprite_index: self.sprite_index,
		}
		sprite_index = spr_player_taunt
		image_index = random_range(0, image_number)
		taunttimer = 20
		state = states.taunt
		particle_create(x, y, particles.taunt)
		scr_sound_pitched(sfx_taunt)
	}
}
