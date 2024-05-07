image_xscale = playerid.xscale
if (playerid.state != states.rocket && playerid.state != states.mach3 && playerid.state != states.crouchslide && playerid.state != states.shoulderbash)
	instance_destroy()
x = (playerid.x + ((playerid.character == "M" ? 18 : 0) * playerid.xscale))
y = (playerid.y - (playerid.character == "M" ? 10 : 0))
if (playerid.state == states.rocket)
	x = (playerid.x + (playerid.xscale * 18))
visible = (!(room == rank_room))
if (place_meeting(x, y, obj_secretportal) or place_meeting(x, y, obj_secretportalstart))
	visible = false
