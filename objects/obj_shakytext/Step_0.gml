visible = global.option_showhud || instance_exists(obj_options) || obj_pause.pause

if instance_exists(obj_player)
	dir = sign(obj_player.xscale)

image_alpha = approach(image_alpha, show ? 1 : 0, show ? 0.05 : 0.01)

if locked_pos
{
	x = SCREEN_WIDTH / 2
	y = SCREEN_HEIGHT - 50
}
