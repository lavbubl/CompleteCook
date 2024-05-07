if ((!released) && global.panic)
{
	if (inst != noone && (!instance_exists(inst)))
		inst = noone
	if (obj_player.x > x)
	{
		released = 1
		image_speed = 0.35
	}
}
else if (floor(image_index) == 3 && (!instance_exists(inst)))
{
	inst = instance_create(obj_player1.x, (y + 13), obj_policecar)
	inst.targetplayer = obj_player1
	inst.targetRoom = targetRoom
	inst.targetDoor = targetDoor
}
