global.parallaxLayers = {}
var a = layer_get_all()
for (var i = 0; i < array_length(a); i++) {
	var name = layer_get_name(a[i])
	if string_starts_with(name, "Backgrounds_") ||string_starts_with(name, "Foregrounds_")
		global.parallaxLayers[$ name] = new parallaxLayer(name)
}