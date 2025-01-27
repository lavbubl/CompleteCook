instance_create_depth(screen_w / 2, 560, 0, obj_pizzatime)

var p_id = instance_create(x, y, obj_enemycorpse)

with p_id
{
	sprite_index = spr_pillar_dead
	image_xscale = other.image_xscale
}

var f_id = instance_create(0, 0, obj_pillarflash)
f_id.pillar_id = p_id

global.panic = true
global.panic_timer = 5000
