with (instance_place((x + spd), y, obj_shotgunblock))
	instance_destroy()
with (instance_place(x, (y - spdh), obj_shotgunblock))
	instance_destroy()
with (instance_place((x + spd), y, obj_destructibles))
	instance_destroy()
x += spd
y += (-spdh)
