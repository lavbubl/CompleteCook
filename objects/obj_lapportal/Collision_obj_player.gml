if (sprite_index == spr_pizzaportalend || sprite_index == spr_pizzaportal_outline || !global.panic.active)
	exit;

reset_anim(spr_pizzaportalend)

other.sprite_index = spr_pizzaportalend
other.visible = false
other.state = states.actor

fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/lapportal", x, y)

global.score += 3000
global.combo.timer = 60

with instance_create(other.x, other.y, obj_collect_number)
	num = 3000
