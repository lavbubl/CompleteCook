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
			scr_sound(sfx_suplexdash)
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

function player_sounds()
{
	struct_foreach(loop_sounds, function(_name, _data)
	{
		var _id = obj_player
		
		if (_id.state == _data.state && !audio_is_playing(_data.sound))
			_data.sndid = scr_sound(_data.sound, true)
		
		if (_id.state != _data.state && _data.sndid != -1)
			audio_stop_sound(_data.sndid)
		
		if _data.func != -1
		{
			if _data.func()
				audio_stop_sound(_data.sndid)
		}
	})
	
	if (state != states.grab)
		audio_stop_sound(sfx_suplexdash)
		
}

function do_hurt()
{
	state = states.hurt
	hsp = -8 * xscale
	vsp = -12
	global.combo.timer -= 30
	i_frames = 100
	scr_sound_pitched(sfx_hurt)
}
