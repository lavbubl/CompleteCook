if image_alpha <= 0
	exit;

draw_set_alpha(image_alpha)

for (var i = 0; i < array_length(tile_arr); i++)
{
	with tile_arr[i]
		draw_tile(tileset, data, 0, x, y)
}

draw_reset_color(1)
