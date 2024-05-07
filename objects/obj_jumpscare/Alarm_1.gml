if (!global.panic)
{
	with (obj_player1)
	{
		lastroom = room
		state = states.normal
		room_goto(targetRoom)
		if (targetDoor == "S")
		{
			targetDoor = lastTargetDoor
			lastTargetDoor = "S"
		}
	}
}
else
{
	with (obj_player)
	{
		if check_player_coop()
			state = states.animatronic
	}
	instance_destroy()
}
