instance_create(x, y, obj_dynamiteexplosion)
var _y = y - 4
with (instance_create(x + (image_xscale * 40), _y, obj_vigilantebazookatrail))
	image_xscale = other.image_xscale
with (instance_create(x - (image_xscale * 40), _y, obj_vigilantebazookatrail))
	image_xscale = -other.image_xscale
