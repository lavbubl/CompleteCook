bg_scroll.x = 0
bg_scroll.y = 0

offsets = []

l = layer_get_all()

for (var i = 0; i < array_length(l); i++)
{
	var bg_id = l[i]
	
	var s = {
		x: layer_get_x(bg_id),
		y: layer_get_y(bg_id)
	}
	
	array_push(offsets, s)
}
