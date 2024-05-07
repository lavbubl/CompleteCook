function scr_room_updated(argument0)
{
	if (argument0 == room or (room == live_blank_room && live_live_room == argument0))
	{
		with (obj_player)
		{
			hallway = savedhallway
			hallwaydirection = savedhallwaydirection
			vhallwaydirection = savedvhallwaydirection
			verticalhallway = savedverticalhallway
		}
		room_goto_live(argument0)
	}
	exit;
}

