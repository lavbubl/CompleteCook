var _active = 0
with (obj_wirewall)
{
	if (trigger == other.trigger)
		_active = 1
}
active = _active
if independant
	active = 1
if active
{
	with (instance_place((x + 1), y, obj_player))
		scr_hurtplayer(id)
	with (instance_place((x - 1), y, obj_player))
		scr_hurtplayer(id)
	with (instance_place(x, (y + 1), obj_player))
		scr_hurtplayer(id)
	with (instance_place(x, (y - 1), obj_player))
		scr_hurtplayer(id)
}
image_index = active
if (active == 0)
	instance_destroy()
