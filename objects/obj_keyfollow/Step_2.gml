var old_x = xoffset

xoffset = wave(-40, 40, 2, 10)
yoffset = wave(-30, 48, 4, 10)

x = obj_player.x + xoffset
y = obj_player.y + yoffset

var player_depth = obj_player.depth

if (xoffset != old_x)
    depth = player_depth + sign(old_x - xoffset)

if !obj_player.haskey
    instance_destroy()
	