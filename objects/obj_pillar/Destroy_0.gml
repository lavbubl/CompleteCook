if ds_list_find_index(global.ds_saveroom, id) != -1
	exit;

instance_create_depth(screen_w / 2, 560, 0, obj_pizzatime)

var p_id = instance_create(x, y, obj_enemycorpse)

with p_id
{
	sprite_index = spr_pillar_dead
	image_xscale = other.image_xscale
}

var f_id = instance_create(0, 0, obj_pillarflash)
f_id.pillar_id = p_id

global.panic.active = true
global.panic.timer = 5000
global.panic.timer_max = 5000
global.doorshut = false

scr_sound(sfx_killenemy)
scr_sound(sfx_pillarimpact)
scr_sound(sfx_escaperumble)
do_enemygibs()

global.combo.count++
global.combo.timer = 60

obj_player.supertauntcount++

ds_list_add(global.ds_saveroom, id)