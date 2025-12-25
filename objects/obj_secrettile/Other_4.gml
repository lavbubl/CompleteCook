//get secret tile layers
var layers = layer_get_all()
var secret_layers = []

for (var i = 0; i < array_length(layers); i++) 
{
	var cur_layer = layers[i]
	if (string_starts_with(layer_get_name(cur_layer), "Tiles_Secret"))
	{
		array_push(secret_layers, cur_layer)
		layer_set_visible(cur_layer, false)
	}
}

if secret_layers == []
	exit; //tile_arr stays empty

var tile_size = 32

for (var xx = x; xx < bbox_right; xx += tile_size)
{
	for (var yy = y; yy < bbox_bottom; yy += tile_size)
	{
		for (var i = 0; i < array_length(secret_layers); i++) 
		{
			var map_id = layer_tilemap_get_id(secret_layers[i])
			
			var t = {
				tileset: tilemap_get_tileset(map_id),
				data: tilemap_get_at_pixel(map_id, xx, yy),
				x: xx,
				y: yy
			}
			
			array_push(tile_arr, t)
		}
	}
}
