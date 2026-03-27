event_inherited()

sprs.move = spr_minijohn_charge
sprs.stun = spr_minijohn_stun
sprs.dead = spr_minijohn_dead
sprs.punchstart = spr_minijohn_punchstart
sprs.punch = spr_minijohn_punch

movespeed = 7
momentum = 5

cooldown = 0

state_struct.normal = {state: states.normal, func: enemy_chase}