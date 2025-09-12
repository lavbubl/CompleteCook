lay_id = layer_get_id(tilelayer);
map_id = layer_tilemap_get_id(lay_id);
alpha = 1
surf = -1
if (layer_get_visible(lay_id)) {
    layer_set_visible(lay_id, false)
    depth = layer_get_depth(lay_id)
}
else {
    instance_destroy()
}