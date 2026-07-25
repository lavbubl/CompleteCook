bg_scroll.x = 0
bg_scroll.y = 0

offsets = []

var _asset_parallaxes = {
	Assets_BG1:			[0.05, 0.05],
	Assets_BG2:			[0.1, 0.1],
	Assets_stillBG:		[0.1, 0],
	Assets_FG1:			[-0.05, -0.05],
	Assets_FG2:			[-0.1, -0.1]
}

l = layer_get_all()

for (var i = 0; i < array_length(l); i++)
{
	var bg_id = l[i]
	
	var s = {
		x: layer_get_x(bg_id),
		y: layer_get_y(bg_id)
	}
	
	array_push(offsets, s)
	
	var _cur_asset_parallax = _asset_parallaxes[$ layer_get_name(bg_id)]
	
	if !is_undefined(_cur_asset_parallax)
	{
		var _sprites = layer_get_all_elements(bg_id)
		
		for (var j = 0; j < array_length(_sprites); ++j)
		{
			var _cur_sprite = _sprites[j]
			
			var _prev_x = layer_sprite_get_x(_cur_sprite)
			var _prev_y = layer_sprite_get_y(_cur_sprite)
			
			layer_sprite_x(_cur_sprite, (_prev_x * ( 1 - _cur_asset_parallax[0])) + ((screen_w / 2) * _cur_asset_parallax[0]))
			layer_sprite_y(_cur_sprite, (_prev_y * ( 1 - _cur_asset_parallax[1])) + ((screen_h / 2) * _cur_asset_parallax[1]))
		}
	}
}
