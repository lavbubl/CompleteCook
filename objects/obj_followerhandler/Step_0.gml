if followers == []
	exit;

var delay = 5

if array_length(pos_array) > (array_length(followers) * delay) + 1
	array_shift(pos_array)

var s = {
	x: obj_player.x,
	y: obj_player.y,
	state: obj_player.state,
	xscale: obj_player.xscale
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
			lerp_spd = 0
		else
			lerp_spd = min(lerp_spd + 0.01, 1)
		
		var distance = 25
		
		x_offset = approach(x_offset, -pos_in_line.xscale * ((i + 1) * distance), distance * 0.2)
		
		if lerp_spd < 1
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
			var issupertaunt = string_starts_with(sprite_get_name(obj_player.sprite_index), "spr_player_supertaunt")
			if (sprite_index != sprs.taunt && sprite_index != sprs.intro) || (issupertaunt && obj_player.image_index <= obj_player.image_speed)
			{
				if !issupertaunt
				{
					sprite_index = sprs.taunt
					image_index = irandom(sprite_get_number(sprite_index) - 1)
				}
				else
					reset_anim(sprs.intro)
				var te = create_effect(x, y, spr_tinytaunt)
				te.image_speed = 0.5
				if sprs.taunt == spr_gerome_taunt
					te.sprite_index = spr_taunteffect //changes the sprite but not its image_number to match. instead spr_taunteffect frame count adjusted to match spr_tinytaunt's. LOL!
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

