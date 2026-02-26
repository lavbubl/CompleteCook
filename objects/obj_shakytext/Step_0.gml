visible = hud_get_visible() || instance_exists(obj_options) || obj_pause.pause

if instance_exists(obj_player)
	dir = sign(obj_player.xscale)

image_alpha = approach(image_alpha, show ? 1 : 0, 0.05)

if locked_pos
{
	x = screen_w / 2
	y = screen_h - 50
}
