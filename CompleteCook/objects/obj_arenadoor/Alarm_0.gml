shot = 0
if (objectlist != -4 && count < array_length(objectlist[wave]) && objectlist[wave] != -4)
{
	finish = 0
	shot = 0
	sprite_index = spr_arenadoor_open
	image_index = 0
}
else
{
	finish = 1
	count = 0
}
