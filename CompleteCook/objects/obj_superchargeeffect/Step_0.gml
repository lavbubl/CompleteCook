image_xscale = playerid.xscale
if (playerid.supercharged == 0)
{
	playerid.superchargedeffectid = -4
	instance_destroy()
}
x = playerid.x
y = playerid.y
if (playerid.state != states.comingoutdoor && playerid.state != states.door)
	visible = playerid.visible
else
	visible = false
