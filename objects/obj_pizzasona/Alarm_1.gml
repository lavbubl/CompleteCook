var _val = 10

global.score += _val
scr_sound_multiple(sfx_collect);
var c = {
	sprite_index: asset_get_index($"spr_{choose("mushroom", "cheese", "pineapple", "sausage", "tomato")}collect"),
	image_index: self.image_index,
	x: self.x - obj_camera.campos.x,
	y: self.adjusted_y - obj_camera.campos.y,
	val: _val
}

array_push(obj_collect_got_visual.collects, c)

if scoretogive > _val
	alarm[1] = 5

scoretogive -= _val