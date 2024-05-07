if (global.spaceblockswitch == 1)
{
	if ((x != xstart or sprite_index != spr_spaceblock_closed) && (!(place_meeting(xstart, ystart, obj_player))) && (!(place_meeting(xstart, ystart, obj_baddie))) && (!(place_meeting(xstart, ystart, obj_clownmato))))
	{
		x = xstart
		y = ystart
		sprite_index = spr_spaceblock_closed
		mask_index = spr_minipillarwoke
		image_alpha = 1
	}
}
else
{
	x = -100
	y = -100
	sprite_index = spr_spaceblock_open
	image_alpha = 0.5
}
