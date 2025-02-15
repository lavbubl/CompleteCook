get_input()

if !surface_exists(bg_surf)
	exit;
	
for (var i = 0; i < array_length(bg_parallax); i++) 
{
	with bg_parallax[i] // with the current layer
		x += spd // increment its x with its speed
}

if (place_meeting(x, y, obj_player) && obj_player.state != states.actor && key_up.down)
{
	with obj_player
	{
		reset_anim(spr_player_startgate)
		state = states.actor
		hsp = 0
		image_speed = 0.35
	}
	
	if obj_music.mu != noone
		audio_sound_gain(obj_music.mu, 0, 2000)
}

var flick = false
with obj_player
{
	if (sprite_index == spr_player_startgate && !obj_fade.fade && image_speed > 0 && anim_ended())
	{
		flick = true
		image_speed = 0
	}
}

if flick
{
	var d = { //readable title data
		music: title_data[0],
		card_index: title_data[1],
		title_index: title_data[2]
	}
	with instance_create(0, 0, obj_titlecard)
	{
		music = d.music
		card_index = d.card_index
		title_index = d.title_index
		t_room = other.t_room
		t_door = other.t_door
	}
}
