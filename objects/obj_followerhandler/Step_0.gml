if followers == []
	exit;

var delay = 5

if array_length(pos_array) > (array_length(followers) * delay) + 1
	array_shift(pos_array)

var s = {
	x: obj_player.x,
	y: obj_player.y,
	state: obj_player.state
}

array_push(pos_array, s)

for (var i = 0; i < array_length(followers); i++) 
{	
	var follower = followers[i]
	
	if !obj_player.hasgerome && follower.sprs.idle == spr_gerome_keyidle
	{
		array_delete(followers, i, 1)
		continue;
	}
	
	var index_cal = (array_length(pos_array) - 1) - ((i + 1) * delay)
	var pos_in_line = pos_array[max(index_cal, 0)]
	var prev_pos_in_line = pos_array[max(index_cal - delay, 0)]
	
	with follower
	{
		if (obj_player.state == states.taunt || pos_in_line.state == states.taunt)
			lerp_spd = i * -0.005
		else
			lerp_spd = min(lerp_spd + 0.005, 0.5)
		
		var distance = 32
		var condition = obj_player.hsp == 0 && obj_player.grounded
		x_offset = approach(x_offset, condition ? -obj_player.xscale * ((i + 1) * distance) : 0, 4)
		
		if lerp_spd < 0.5
		{
			x = lerp(x, pos_in_line.x + x_offset, max(lerp_spd, 0))
			y = lerp(y, pos_in_line.y, max(lerp_spd, 0))
		}
		else
		{
			x = pos_in_line.x + x_offset
			y = pos_in_line.y
		}
		
		if obj_player.state == states.taunt
		{
			if sprite_index != sprs.taunt && sprite_index != sprs.intro
			{
				if !string_starts_with(sprite_get_name(obj_player.sprite_index), "spr_player_supertaunt") //too dumb to think of the best solution
				{
					sprite_index = sprs.taunt
					image_index = irandom(sprite_get_number(sprite_index) - 1)
				}
				else
					reset_anim(sprs.intro)
				create_effect(x, y, spr_tinytaunt)
			}
		}
		else if pos_in_line.x != prev_pos_in_line.x
			sprite_index = sprs.move
		else
			sprite_index = global.panic.active ? sprs.panic : sprs.idle
		
		if sprite_index != sprs.taunt
			image_index = wrap(sprite_get_number(sprite_index), image_index + 0.35)
	}
}

