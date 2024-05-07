global.levelcomplete = 1
scr_playerreset()
with (obj_player)
{
	targetDoor = "A"
	targetRoom = rm_levelselect
	room = rm_levelselect
	x = -100
	y = -100
	state = states.titlescreen
	image_blend = c_white
}
global.level_minutes = 0
global.level_seconds = 0