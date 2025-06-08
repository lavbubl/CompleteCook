depth = -50
image_speed = 0.35

sprs = {
	idle: spr_rattumbleblock_small,
	bump: spr_rattumbleblock_small_bump,
	dead: spr_rattumbleblock_small_dead,
}

if ds_list_find_index(global.ds_saveroom, id) != -1
	instance_destroy()

ratsound = scr_sound_3d(sfx_ratsniff, x, y, true)
