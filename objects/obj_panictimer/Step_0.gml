if !global.panic
	exit;

if global.panic_timer > 0
	global.panic_timer--
else
	global.panic_timer = 0

if (global.panic && global.panic_timer <= 0 && !instance_exists(obj_grindrail))
	instance_create(obj_player.x, obj_player.y, obj_grindrail)

shake_camera(1)
