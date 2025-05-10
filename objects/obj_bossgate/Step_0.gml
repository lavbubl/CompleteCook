get_input()

if (place_meeting(x, y, obj_player) && obj_player.state != states.actor && key_up.down && obj_player.grounded)
{
	with obj_player
	{
		reset_anim(spr_player_entergate)
		state = states.actor
		hsp = 0
		movespeed = 0
		image_speed = 0.35
		spawn = noone
		return_location = {
			x: x,
			y: y,
			room: room
		}
	}
	
	if obj_music.mu != noone
		audio_sound_gain(obj_music.mu, 0, 2000)
}

var flick = false
with instance_place(x, y, obj_player)
{
	if (sprite_index == spr_player_entergate && !obj_fade.fade && image_speed != 0 && anim_ended())
	{
		flick = true
		image_speed = 0
	}
}

if flick
{
	do_fade(t_room, t_door, fade_types.generic)
}
