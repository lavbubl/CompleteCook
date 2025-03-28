var ty = down ? 24 : -sprite_height
y = approach(y, ty, movespeed)

if (down && y >= ty && alarm[0] == -1)
	alarm[0] = 80
else if (!down && y <= ty)
	instance_destroy()

x = screen_w / 2;
