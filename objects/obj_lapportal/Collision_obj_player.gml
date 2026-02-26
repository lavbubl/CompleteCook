if (sprite_index == spr_pizzaportalend || sprite_index == spr_pizzaportal_outline || !global.panic.active)
	exit;

reset_anim(spr_pizzaportalend)

other.sprite_index = spr_pizzaportalend
other.visible = false
other.state = states.actor

scr_sound_3d(sfx_secretenter, x, y, false)
scr_sound_3d(sfx_lapportal, x, y, false)

global.score += 3000
global.combo.timer = 60

with instance_create(other.x, other.y, obj_collect_number)
	num = 3000
