with (obj_player)
{
	var check_up = (key_up.down && place_meeting(x, y, obj_ladder))
	var check_down = (key_down.down && place_meeting(x, y + 1, obj_ladder) && !place_meeting(x, y + 1, obj_solid) && sprite_index != spr_player_crouchslip)
	if ((check_up || check_down) 
		
		&& state != states.ladder 
		&& sprite_index != spr_player_jump)
	{
		state = states.ladder
		hsp = 0
		movespeed = 0
		x = other.x + 16
		if (!key_up.down)
			y++
	}
}