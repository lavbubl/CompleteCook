if (collision && other.brick && other.isgustavo)
{
	instance_destroy()
	other.brick = 0
	with (instance_create(x, y, obj_brickcomeback))
		trapped = 1
}
