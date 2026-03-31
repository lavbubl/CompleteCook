with instance_place(x, y - 1, obj_player)
{
	var check_up = (input.up.check && place_meeting(x, y, obj_ladder))
	var check_down = (input.down.check && place_meeting(x, y + 1, obj_ladder) && !place_meeting(x, y + 1, obj_solid) && state != states.tumble && state != states.divebomb)
	if	(check_up || check_down) && 
		state != states.ladder && 
		state != states.taunt &&
		ladderbuffer <= 0 &&
		!intransfo
	{
		state = states.ladder
		hsp = 0
		movespeed = 0
		x = other.x + 16
	}
}
