if global.timedgatetimer
{
	activated = 0
	x = -100
	y = -100
}
else if ((!activated) && (!(place_meeting(xstart, ystart, obj_player))) && (!(place_meeting(xstart, ystart, obj_weeniemount))))
{
	activated = 1
	x = xstart
	y = ystart
}
