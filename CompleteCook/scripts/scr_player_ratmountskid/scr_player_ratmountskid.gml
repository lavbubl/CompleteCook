function scr_player_ratmountskid()
{
	hsp = (xscale * (-movespeed))
	movespeed = Approach(movespeed, 0, 0.8)
	if brick
		sprite_index = spr_ratmount_skid
	else
		sprite_index = spr_lonegustavo_skid
	gustavodash = 0
	ratmount_movespeed = 8
	image_speed = 0.4
	if (movespeed <= 0)
		state = states.ratmount
	if (key_jump && (!key_up))
		input_buffer_jump = 0
	if (input_buffer_jump < 8 && grounded && sprite_index != spr_player_ratmountswallow)
	{
		particle_set_scale(particle.highjumpcloud2, xscale, 1)
		create_particle(x, y, particle.highjumpcloud2, 0)
		scr_soundeffect(sfx_jump)
		if brick
			sprite_index = spr_player_ratmountjump
		else if (ratmount_movespeed >= 12)
			sprite_index = spr_lonegustavo_dashjump
		else
			sprite_index = spr_player_ratmountgroundpound
		image_index = 0
		movespeed = hsp
		jumpAnim = 1
		state = states.ratmountjump
		vsp = -11
		jumpstop = 0
	}
	if (key_slap2 && brick)
		ratmount_kickbrick()
	else if (key_slap2 && (!brick))
	{
		ratmountpunchtimer = 25
		state = states.ratmountpunch
		image_index = 0
		if (move != 0)
			xscale = move
		movespeed = hsp
		sprite_index = spr_lonegustavo_punch
	}
	if ((!instance_exists(dashcloudid)) && grounded)
	{
		with (instance_create(x, y, obj_dashcloud))
		{
			image_xscale = other.xscale
			other.dashcloudid = id
		}
	}
	exit;
}

