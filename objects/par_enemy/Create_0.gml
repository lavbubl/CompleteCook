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
escape_frozen = false
do_particles = true

follow_player = false
pd_frame_offset = [2, 1, 0, -1, -2, -1, 0, 1] //can be truncated to.. some sort of math thing idfk

state_struct = {
	normal: {state: states.normal, func: enemy_normal},
	scared: {state: states.scared, func: enemy_scared},
	grabbed: {state: states.grabbed, func: enemy_grabbed},
	stun: {state: states.stun, func: enemy_stun},
	hit: {state: states.hit, func: enemy_hit}
}

sprs = {
	move: spr_slime_move,
	scared: spr_slime_scared,
	dead: spr_slime_dead,
	stun: spr_slime_stun,
	turn: spr_slime_move
}

mask_index = mask_player
