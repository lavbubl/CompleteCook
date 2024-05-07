with (obj_player1)
{
	targetDoor = other.targetDoor
	targetRoom = other.targetRoom
	visible = true
	sprite_index = spr_slipbanan1
	image_index = 0
	state = states.slipbanan
}
instance_create(x, y, obj_fadeout)
