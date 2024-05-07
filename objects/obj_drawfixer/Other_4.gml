if (room != kidsparty_entrance1)
{
	var roomname = room_get_name(room)
	roomname = string_letters(roomname)
	if (roomname == "kidspartyfloor" or roomname == "kidspartyentrance")
	{
		kidsparty_lightning = 1
		dark_lightning = 0
	}
	else
	{
		kidsparty_lightning = 0
		dark_lightning = 0
	}
}
else
{
	kidsparty_lightning = 0
	dark_lightning = 0
}
if (room == dungeon_5 or room == dungeon_6)
{
	use_dark = 1
	for (var i = 0; i < array_length(dark_arr); i++)
		layer_shader(dark_arr[i], 5)
}
else
	use_dark = 0
