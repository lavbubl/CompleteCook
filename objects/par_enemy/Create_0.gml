init_collide()

xscale = 1
yscale = 1
flash = false
warp = 0

state = e_states.normal
movespeed = 0
scared_timer = 0
stun_timer = 0
blur_timer = 0

state_struct = {
	normal: {state: e_states.normal, func: enemy_normal},
	scared: {state: e_states.scared, func: enemy_scared},
	grabbed: {state: e_states.grabbed, func: enemy_grabbed},
	stun: {state: e_states.stun, func: enemy_stun},
	hit: {state: e_states.hit, func: enemy_hit}
}

sprs = {
	move: spr_slime_move,
	scared: spr_slime_scared,
	dead: spr_slime_dead,
	stun: spr_slime_stun
}

pd_frame_offset = [2, 1, 0, -1, -2, -1, 0, 1]

follow_player = false
