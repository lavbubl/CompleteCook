with instance_place(x, y - 1, obj_player)
{
	var check_up = (input_direction_check(INPUTS.up) && place_meeting(x, y, obj_ladder))
	var check_down = (input_direction_check(INPUTS.down) && place_meeting(x, y + 1, obj_ladder) && !place_meeting(x, y + 1, obj_solid))
	if ((check_up && (state = states.normal || state = states.mach2 || state = states.mach3 || state = states.punch || state = states.jump)) || (check_down && (state = states.normal || state = states.crouch))) && ladderbuffer <= 0 && !intransfo
	{
		state = states.ladder
		hsp = 0
		movespeed = 0
		x = other.x + 16
	}
}
