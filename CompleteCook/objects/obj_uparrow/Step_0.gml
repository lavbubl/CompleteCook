image_speed = 0.35
with (playerid)
{
	if (((!(place_meeting(x, y, obj_taxi))) && (!(place_meeting(x, y, obj_dresser))) && (!(place_meeting(x, y, obj_dialognpc))) && (!(place_meeting(x, y, obj_door))) && (!(place_meeting(x, y, obj_keydoor))) && (!(place_meeting(x, y, obj_exitgate))) && (!(place_meeting(x, y, obj_filedoor))) && (!(place_meeting(x, y, obj_optiondoor)))) or (!grounded) or state != states.normal)
		instance_destroy(other)
}
x = playerid.x
y = (playerid.y - 50)
