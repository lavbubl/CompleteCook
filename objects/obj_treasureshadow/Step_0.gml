x = obj_player.x
y = obj_player.y

if obj_player.grounded
    visible = true
else
    visible = false

image_xscale = obj_player.xscale

if (!obj_player.visible)
    visible = false
