function scr_player_Sjump()
{
	move = (key_right + key_left)
	hsp = 0
	mach2 = 0
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 0
	machhitAnim = 0
	if (sprite_index == spr_superjump)
	{
		if (steppybuffer > 0)
			steppybuffer--
		else
		{
			create_particle(x + irandom_range(-25, 25), y + irandom_range(-10, 35), particle.cloudeffect, 0)
			steppybuffer = 8
		}
		if (piledrivereffect > 0)
			piledrivereffect--
		else
		{
			with (instance_create(x, y, obj_parryeffect))
			{
				sprite_index = spr_piledrivereffect
				image_yscale = -1
			}
			piledrivereffect = 15
		}
	}
	if (sprite_index == spr_superjump or sprite_index == spr_superspringplayer)
		vsp = sjumpvsp
	sjumpvsp -= 0.1
	if (sprite_index == spr_player_supersidejump)
	{
		if (a < 25)
			a++
		hsp = (xscale * a)
		vsp = 0
	}
	if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))))
	{
		pizzapepper = 0
		a = 0
		if (sprite_index == spr_player_supersidejump)
			sprite_index = spr_player_supersidejumpland
		if (sprite_index == spr_superjump or sprite_index == spr_superspringplayer)
			sprite_index = spr_superjumpland
		with (obj_camera)
		{
			shake_mag = 10
			shake_mag_acc = (30 / room_speed)
		}
		with (obj_baddie)
		{
			if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
			{
				image_index = 0
				if grounded
					vsp = -7
			}
		}
		scr_soundeffect(sfx_groundpound)
		image_index = 0
		state = states.Sjumpland
		machhitAnim = 0
	}
	else if (key_slap2 && sprite_index != spr_superspringplayer && sprite_index != spr_player_Sjumpcancelstart)
	{
		image_index = 0
		sprite_index = spr_player_Sjumpcancelstart
		scr_soundeffect(sfx_superjumpcancel)
		audio_stop_sound(sfx_superjumprelease)
	}
	if (sprite_index == spr_player_Sjumpcancelstart)
	{
		vsp = 0
		if (move != 0)
			xscale = move
		if (floor(image_index) == (image_number - 1))
		{
			vsp = -5
			movespeed = 12
			image_index = 0
			sprite_index = spr_player_Sjumpcancel
			flash = true
			state = states.mach3
			with (instance_create(x, y, obj_crazyrunothereffect))
				image_xscale = other.xscale
		}
	}
	if (character == "N" && key_jump2)
	{
		scr_soundeffect(sfx_jump)
		scr_soundeffect(sfx_woosh)
		jumpstop = 0
		vsp = -15
		state = states.jump
		sprite_index = spr_playerN_noisebombspinjump
		image_index = 0
		with (instance_create(x, y, obj_jumpdust))
			image_xscale = other.xscale
	}
	if (character == "N")
	{
		if (move == 1)
			hsp = 3
		if (move == -1)
			hsp = -3
	}
	image_speed = 0.5
	scr_collide_player()
	exit;
}

