var o = 0

if collected
{
	o = 50
	shine_ix = wrap(3, shine_ix + 0.35)
	draw_sprite(spr_treasureshine, shine_ix, x, y - o)
}

draw_sprite(sprite_index, image_index, x, y - o)