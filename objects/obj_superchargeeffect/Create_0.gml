playerid = instance_place(x, y, obj_player).id
image_speed = 0.5
image_xscale = playerid.xscale
if (instance_exists(playerid) && playerid.supercharged == 0)
{
	playerid.superchargedeffectid = -4
	instance_destroy()
}
depth = -8
