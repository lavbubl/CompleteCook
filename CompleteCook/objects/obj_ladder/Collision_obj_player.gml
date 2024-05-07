with (other)
{
	if (key_up && ladderbuffer == 0 && (state == states.normal or state == states.pogo or state == states.mach2 or state == states.mach3 or state == states.mach1 or state == states.shotgunjump or state == states.jump or state == states.highjump) && state != states.hurt && state != states.machslide && state != states.freefall && state != states.freefallland)
	{
		state = states.ladder
		x = (other.x + 16)
		y = floor(y)
		if ((y % 2) == 1)
			y -= 1
	}
	if (key_up && ladderbuffer == 0 && (state == states.ratmountjump or state == states.ratmount))
	{
		state = states.ratmountladder
		if (brick == 1)
		{
			with (instance_create(x, y, obj_brickcomeback))
			{
				wait = 1
				instance_create(x, y, obj_genericpoofeffect)
			}
		}
		brick = 0
		x = (other.x + 16)
		y = floor(y)
		if ((y % 2) == 1)
			y -= 1
	}
}
