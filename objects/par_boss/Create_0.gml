init_collide()

xscale = 1
yscale = 1
flash = false
warp = 0

state = states.normal
movespeed = 0
scared_timer = 0
stun_timer = 0
blur_timer = 0
do_turn = false
hurtbox_id = -4
taunted = false
vulnerable = false
alarm[1] = 200

sprs = {
	move: spr_slime_move,
	scared: spr_slime_scared,
	dead: spr_slime_dead,
	stun: spr_slime_stun,
	turn: spr_slime_move
}

mask_index = mask_player
