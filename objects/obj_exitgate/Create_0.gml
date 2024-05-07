image_speed = 0
image_index = 1
if (room != rm_editor)
	depth = 50
roomname = room_get_name(room)
global.progress = string_letters(roomname)
drop = 0
drop_y = y
vsp = 0
grav = 0.5
dropstate = states.normal
hand_y = (y - 1000)
handsprite = 207
handindex = 0
if (obj_player.character == "S")
	instance_destroy()
