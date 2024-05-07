if (room == rm_editor)
{
	mask_index = spr_minipillarwoke
	exit;
}
if (global.panic == false)
{
	x = -100
	y = -100
	sprite_index = spr_minipillarsleep
	mask_index = spr_minipillarsleep
}
else
{
	mask_index = spr_minipillarwoke
	sprite_index = spr_minipillarwoke
	x = xstart
	y = ystart
}
