if global.panic.active
{
	x = xstart
	y = ystart
	sprite_index = spr_pillarblock_awake
}
else
{
	x = -1000
	y = -1000
	sprite_index = spr_pillarblock
}

//this feels prettier than using a ternary, DONT DO IT.