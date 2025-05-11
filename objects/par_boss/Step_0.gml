switch state
{
	case states.stun:
		boss_stun()
		break;
	case states.hit:
		boss_hit()
}

do_scared()

grav = 0.5
if (state == states.hit)
	grav = 0

if (place_meeting(x, y, obj_player))
{
	if ((obj_player.instakill || obj_player.state == states.grab) && vulnerable)
	{
		with (obj_player)
		{
			if (state == states.mach3)
				reset_anim(spr_player_mach3hit)
			if (key_jump.down && state != states.groundpound)
			{
				vsp = -10
				jumpstop = false
			}
		}
		
		sprite_index = sprs.stun
	
		do_enemygibs()
		shake_camera()
		scr_sound_3d(sfx_punch, x, y)
		
		obj_player.hitstun = 5
		obj_player.prev_ix = obj_player.image_index
		obj_bossstate.opponent.hp--
		vulnerable = false
		state = states.hit
		
		var spd = 10
		
		hsp = x - obj_player.x >= 0 ? spd : -spd
		xscale = x - obj_player.x >= 0 ? -1 : 1
		
		if obj_player.state == states.grab
			alarm[0] = 5
	}
	if ((obj_player.state == states.mach2 || obj_player.state == states.tumble) && stun_timer < 160 && vulnerable)
	{
		sleep(50)
		hsp = obj_player.xscale * 18
		xscale = -obj_player.xscale
		warp = 0.4
		state = states.stun
		stun_timer = 180
		vsp = -5
		repeat (4)
			particle_create(x, y, particles.stars)
		flash = 8
	}
}

if blur_timer > 0
	blur_timer--
else if state == states.hit
{
	afterimage_create(after_images.blur)
	blur_timer = 2
}

if (obj_player.state == states.taunt)
{
	scared_timer = 0
	stun_timer = 0
}

warp = approach(warp, 0, 0.025)

if flash > 0
	flash--

var en_list = ds_list_create()
instance_place_list(x, y, par_enemy, en_list, false)

for (var i = 0; i < ds_list_size(en_list); i++) {
    var _id = ds_list_find_value(en_list, i)
	if place_meeting(x, y, _id)
	{
		if _id.state == states.hit
			instance_destroy()
	}
}

if vulnerable && !audio_is_playing(sfx_vulnerable)
	scr_sound(sfx_vulnerable, true)
else if !vulnerable && audio_is_playing(sfx_vulnerable)
	audio_stop_sound(sfx_vulnerable)

ds_list_destroy(en_list)
break_destroyables()
collide()
