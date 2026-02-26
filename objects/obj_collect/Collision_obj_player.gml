global.score += val
global.combo.timer += 10

var c = {
	sprite_index: self.sprite_index,
	image_index: self.image_index,
	x: self.x - obj_camera.campos.x,
	y: self.y - obj_camera.campos.y,
	val: self.val
}

array_push(obj_collect_got_visual.collects, c)

with instance_create(x, y, obj_collect_number)
	num = other.val

instance_destroy()
