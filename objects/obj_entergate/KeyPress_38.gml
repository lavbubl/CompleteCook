if place_meeting(x, y, obj_player) && obj_player.state != states.actor
{
	with obj_player
	{
		reset_anim(spr_player_enterlevelgate)
		state = states.actor
		hsp = 0
		image_speed = 0.35
	}
	if obj_music.mu != -1
		audio_sound_gain(obj_music.mu, 0, 1500)
	alarm[0] = 120
	global.level_data.level_name = l_name
}
