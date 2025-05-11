with (instance_place(x, y - 1, obj_player))
{
	var check_up = (key_up.down && place_meeting(x, y, obj_ladder))
	var check_down = (key_down.down && place_meeting(x, y + 1, obj_ladder) && !place_meeting(x, y + 1, obj_solid) && sprite_index != spr_player_crouchslip && sprite_index != spr_player_dive)
	if ((check_up || check_down) && state != states.ladder && ladderbuffer <= 0)
	{
		state = states.ladder
		hsp = 0
		movespeed = 0
		x = other.x + 16
	}
}