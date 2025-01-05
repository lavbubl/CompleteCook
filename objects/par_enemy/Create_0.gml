init_collide()

state = e_states.normal
movespeed = 0
scared_timer = 0

state_struct = {
	normal: {state: e_states.normal, func: enemy_normal},
	scared: {state: e_states.scared, func: enemy_scared},
	grabbed: {state: e_states.grabbed, func: enemy_grabbed},
	stun: {state: e_states.stun, func: enemy_stun}
}

sprs = {
	move: spr_slime_move,
	scared: spr_slime_scared,
	dead: spr_slime_dead,
	stun: spr_slime_stun
}

follow_player = false
