with (obj_player)
{
	obj_music.fadeoff = 0
	targetDoor = "A"
	targetRoom = other.targetRoom
	if (!instance_exists(obj_fadeout))
		instance_create(x, y, obj_fadeout)
}
obj_titlecard.fadeout = true
