// update input
key_up.update(global.keybinds.up);

if surface_exists(bg_surf)
{
	for (var i = 0; i < array_length(bg_parallax); i++) 
	{
		with bg_parallax[i] // with the current layer
			x += spd // increment its x with its speed
	}
}

if (place_meeting(x, y, obj_player) && scr_can_enter_door(obj_player.state) && key_up.check && obj_player.grounded)
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
	if (sprite_index == spr_player_entergate && !obj_fade.fade && image_speed > 0 && anim_ended())
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
	
	global.level_data.level_name = self.level_name
}
