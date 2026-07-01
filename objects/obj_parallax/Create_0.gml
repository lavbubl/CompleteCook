#macro CAM_X camera_get_view_x(view_camera[0])
#macro CAM_Y camera_get_view_y(view_camera[0])
#macro CAM_W camera_get_view_width(view_camera[0])
#macro CAM_H camera_get_view_height(view_camera[0])
global.parallaxLayers = {}
parallaxFactors = {
	Backgrounds_1 : 0.25,
	Backgrounds_2 : 0.2,
	Backgrounds_2 : 0.15,
	Backgrounds_scroll : 0.3,
	Backgrounds_scroll1 : 0.3,
	Backgrounds_scroll2 : 0.25,
	Backgrounds_scroll3 : 0.2,	
    Backgrounds_Ground1 : 0.2,
    Backgrounds_Ground2 : 0.18,
    Backgrounds_Ground3 : 0.16,
	Backgrounds_stillH1 : 1,
	Backgrounds_stillH1 : 1 - 0.3,
	Backgrounds_stillH2 : 1 - 0.35,
	Backgrounds_stillH3 : 1 - 0.4,
	Backgrounds_stillH4 : 1 - 0.45,
	Backgrounds_H1 : 0.22,
	Backgrounds_H2 : 0.11,
	Foregrounds_1 : -0.15,
	Foregrounds_2 : -0.25,
	Foregrounds_3 : -0.35,
	Foregrounds_Ground1 : -0.15,
	Foregrounds_Ground2 : -0.25,
	Foregrounds_Ground3 : -0.35,
}
parallaxLayer = function(lay) constructor {
	name = layer_get_name(lay)
	factor = struct_get(other.parallaxFactors, name) ?? 0
	
	bgID = layer_background_get_id(lay)
	layerid = lay

	sprite_index = layer_background_get_sprite(bgID)
	image_index = layer_background_get_index(bgID)
	image_speed = layer_background_get_speed(bgID)
	layer_background_speed(bgID, 0)
	
	x_offset = layer_get_x(lay)
	y_offset = layer_get_y(lay)
	x = x_offset
	y = y_offset
	x_scroll = 0
	y_scroll = 0
	
	// so you can set these like: 'global.parallaxLayers.Backgrounds_scroll.vsp = -14' or idk (if the layer exists ofc)
	vsp = layer_get_vspeed(lay)
	hsp = layer_get_hspeed(lay)
	layer_vspeed(lay, 0)
	layer_hspeed(lay, 0)
	
	var str = name
	var i = 0
	var maxLayerCount = 5
	repeat maxLayerCount {
		i++
		str = string_replace_all(str, string(i), "")
	}
	baseName = str
	static calculateStillX = function() {
		var a = max(CAM_X / (room_width - CAM_W), 1) * (sprite_get_width(sprite_index) - screen_w)
		return CAM_X - a
	}
	static calculateStillY = function() { 
		var a = max(CAM_Y / (room_height - CAM_H), 1) * (sprite_get_height(sprite_index) - screen_h)
		return CAM_Y - a
	}
	static scroll = function() {
		x_scroll = (x_scroll + hsp) % sprite_get_width(sprite_index)
		y_scroll = (y_scroll + vsp) % sprite_get_height(sprite_index)
	}
	static panicSprite = function(_bg, _panic_bg) {
		if sprite_index == _bg || !sprite_exists(sprite_index) {
			image_index = 0
			sprite_index = _panic_bg
		}
	}
}

