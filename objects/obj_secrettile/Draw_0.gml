if (!(bbox_in_camera(view_camera[0], 32)))
	exit;
if (array_length(tiles) > 0)
{
	for (var k = 0; k < array_length(tilemap_sprite); k++)
	{
		if (tilemap_sprite[k] != -4)
		{
			for (var i = 0; i < array_length(tiles[k]); i++)
			{
				var b = tiles[k][i]
				var _l = b[2]
				var _t = b[3]
				draw_sprite_part_ext(tilemap_sprite[k], 0, _l, _t, 32, 32, b[0], b[1], 1, 1, c_white, alpha)
			}
		}
	}
}
