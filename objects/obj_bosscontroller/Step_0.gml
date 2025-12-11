visible = hud_get_visible(false)

if circ_goaway && surface_exists(circ_surf)
{
	var spd = 10
	var target_size = screen_w * 2
	if circ_size < target_size
		circ_size = approach(circ_size, target_size, spd)
	else
		surface_free(circ_surf)
}

if player.hp <= 0
{
	fade_alpha = approach(fade_alpha, 1, 0.05)
	if alarm[0] < 60
		player_alpha -= 0.05
	with obj_player
	{
		if state != states.defeat
		{
			other.alarm[0] = 250
			movespeed = -10
			state = states.defeat
			vsp = -14
			grounded = false
			reset_anim(spr_playerP_defeat)
			image_speed = 0.35
		}
	}
}

if opponent.hp <= 0 && instance_exists(target_obj)
{
	with obj_music
	{
		audio_stop_sound(mu)
		mu = noone
	}
	
	instance_destroy(target_obj)
	
	with obj_player
	{
		hsp = 0
		vsp = 0
		state = states.actor
		reset_anim(spr_playerP_bossdefeated)
	}
	
	alarm[1] = 600
	
	scr_sound(mu_bossdefeat)
}
