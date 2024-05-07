if (sprite_index == spr_gustavo_showpizza)
{
	sprite_index = spr_gustavo_givepizza
	image_index = 0
	global.showgnomelist = 1
	global.failcutscene = 0
	global.pizzadelivery = 1
	global.hp = 8
	state = states.normal
	global.heattime = 60
}
